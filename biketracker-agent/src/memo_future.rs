use futures::prelude::*;
use std::rc::Rc;

/// A future that keeps its value after it resolves.
/// Differs from futures::future::Fused in that extra polls return the resolved value (or error), rather than going back to returning NotReady.
/// Differs from futures::future::Shared in that the values are not safe to share between threads.
pub enum MemoFuture<F: Future> {
    Resolved(Result<Rc<F::Item>, Rc<F::Error>>),
    InProgress(F),
}

impl<F: Future> MemoFuture<F> {
    pub fn new(inner: F) -> Self {
        MemoFuture::InProgress(inner)
    }
}

impl<F: Future> Future for MemoFuture<F> {
    type Item = Rc<F::Item>;
    type Error = Rc<F::Error>;

    fn poll(&mut self) -> Poll<Self::Item, Self::Error> {
        match self {
            MemoFuture::Resolved(res) => res.clone().map(Async::Ready),
            MemoFuture::InProgress(inner) => match inner.poll() {
                Ok(Async::Ready(value)) => {
                    let value = Rc::new(value);
                    *self = MemoFuture::Resolved(Ok(value.clone()));
                    Ok(Async::Ready(value))
                }
                Ok(Async::NotReady) => Ok(Async::NotReady),
                Err(err) => {
                    let err = Rc::new(err);
                    *self = MemoFuture::Resolved(Err(err.clone()));
                    Err(err)
                }
            },
        }
    }
}

// A future that retries if polled again after a failure.
pub struct RetryFuture<F: Future, B: FnMut() -> F> {
    builder: B,
    future: Option<F>,
}

impl<F: Future, B: FnMut() -> F> RetryFuture<F, B> {
    pub fn new(builder: B) -> Self {
        RetryFuture {
            builder,
            future: None,
        }
    }

    fn mut_future(&mut self) -> &mut F {
        if let Some(ref mut fut) = self.future {
            fut
        } else {
            self.future = Some((self.builder)());
            self.future.as_mut().unwrap()
        }
    }
}

impl<F: Future, B: FnMut() -> F> Future for RetryFuture<F, B> {
    type Item = F::Item;
    type Error = F::Error;

    fn poll(&mut self) -> Poll<Self::Item, Self::Error> {
        match self.mut_future().poll() {
            Ok(Async::Ready(value)) => Ok(Async::Ready(value)),
            Ok(Async::NotReady) => Ok(Async::NotReady),
            Err(err) => {
                self.future = None;
                Err(err)
            }
        }
    }
}
