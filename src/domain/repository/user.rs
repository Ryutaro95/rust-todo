use super::super::TodoEntry;

pub trait TodoRepository {
    fn add(&self, todo: TodoEntry) -> Result<()>;
    fn delete(&self, todo: TodoEntry) -> Result<()>;
}
