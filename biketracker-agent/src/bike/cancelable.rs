use futures::sync::oneshot;

pub struct Canceled;

/// A handle for checking whether an action has been cancelled yet.
pub trait Cancelable {
    fn is_canceled(&mut self) -> bool;

    fn check_canceled(&mut self) -> Result<(), Canceled> {
        if self.is_canceled() {
            Err(Canceled)
        } else {
            Ok(())
        }
    }
}

/// This action can't be cancelled (because it's running synchronously)
pub struct Uncancelable;

impl Cancelable for Uncancelable {
    fn is_canceled(&mut self) -> bool {
        false
    }
}

impl<T> Cancelable for oneshot::Sender<T> {
    fn is_canceled(&mut self) -> bool {
        oneshot::Sender::is_canceled(self)
    }
}
