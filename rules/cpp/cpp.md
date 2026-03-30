# C++ Rules

**Source:** everything-claude-code

## C++ Specific

### Modern C++ (C++17/20)
- Use auto for type inference
- Use range-based for loops
- Use std::optional instead of nullptr
- Use std::string_view instead of const string&
- Use std::variant instead of unions
- Use structured bindings

### Memory Management
- Use smart pointers (unique_ptr, shared_ptr)
- Avoid raw new/delete
- Use make_unique, make_shared
- Use RAII pattern
- Avoid dangling pointers

### Const Correctness
- Use const for read-only data
- Use constexpr for compile-time constants
- Use const member functions
- Use const iterators

### Performance
- Use std::vector, std::array
- Use emplace_back instead of push_back
- Use move semantics (std::move)
- Use return value optimization
- Avoid unnecessary copies

### Error Handling
- Use exceptions for error handling
- Use noexcept for functions that won't throw
- Use assert for debugging
- Use std::error_code for error handling

## STL Usage

### Containers
- Use vector for dynamic arrays
- Use map/unordered_map for key-value
- Use set for unique elements
- Use deque for queue-like access
- Avoid raw arrays

### Algorithms
- Use STL algorithms (sort, find, transform)
- Use lambda expressions
- Use std::function
- Use std::bind

### Concurrency
- Use std::thread
- Use std::mutex for synchronization
- Use std::atomic for atomic operations
- Use std::future for async
- Use std::jthread (C++20)

## Best Practices

### Code Organization
- Use header guards (#pragma once)
- Separate declaration and definition
- Use forward declarations
- Minimize include dependencies

### Testing
- Use Google Test or Catch2
- Use unit tests for functions
- Use integration tests for modules
- Use mocking for dependencies
