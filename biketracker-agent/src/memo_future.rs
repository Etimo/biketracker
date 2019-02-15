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
