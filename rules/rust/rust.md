# Rust Rules

**Source:** everything-claude-code

## Rust Specific

### Safety
- No unsafe code unless necessary
- Use Option/Result for handling absence/errors
- Ownership model enforcement

### Concurrency
- Arc for shared ownership
- Mutex/RwLock for synchronization
- Channels for message passing

### Error Handling
- Result for recoverable errors
- Panic for unrecoverable errors
- thiserror for error types
- anyhow for application errors

### Performance
- Pref under #[bench]
- Avoid allocations in hot paths
- Use iterators efficiently

### Testing
- Unit tests in modules
- Integration tests in tests/
- Doc tests for examples
