# Swift Rules

**Source:** everything-claude-code

## Swift Specific

### Type Safety
- Use Swift's type inference (let x = 10)
- Use struct for value types
- Use class for reference types
- Use enum for related constants
- Use protocol for abstractions

### Optionals
- Use optional binding (if let, guard let)
- Use nil coalescing operator (??)
- Use optional chaining (?.)
- Avoid force unwrapping (!)
- Use guard for early exit

### Memory Management
- Use weak for delegate patterns
- Use unowned for closures that won't be nil
- Use [weak self] in closures
- Avoid retain cycles
- Use instruments for memory profiling

### Error Handling
- Use throws for functions that can fail
- Use do-catch for error handling
- Use Result type for async operations
- Use try? for optional error handling

### Functions
- Use default parameter values
- Use inout for reference parameters
- Use @escaping for escaping closures
- Use @autoclosure for lazy evaluation

## iOS/macOS Specific

### UIKit
- Use view controllers lifecycle properly
- Use Auto Layout (SnapKit)
- Use delegates and data sources
- Use weak self in closures

### SwiftUI
- Use @State, @Binding, @ObservedObject
- Use @Environment for dependency injection
- Use @Published for observable objects
- Use computed properties for derived state

### Architecture
- Use MVVM pattern
- Use Combine for reactive programming
- Use Protocol-Oriented Programming
- Use Dependency Injection

### Testing
- Use XCTest
- Use @testable import
- Use async/await for async tests
- Use MainActor for UI testing
