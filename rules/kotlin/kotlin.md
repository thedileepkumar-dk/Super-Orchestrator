# Kotlin Rules

**Source:** everything-claude-code

## Kotlin Specific

### Type Safety
- Use Kotlin's type system (avoid Java's raw types)
- Use sealed classes for exhaustive when expressions
- Use data classes for DTOs
- Use object for singletons
- Use companion objects for static members

### Null Safety
- Use nullable types (?) explicitly
- Use safe call operator (?.) and elvis operator (?:)
- Use let() for null checks
- Avoid !! operator unless necessary
- Use require() and check() for precondition validation

### Functions
- Use default and named arguments
- Use trailing lambdas syntax
- Use inline functions for reified types
- Use suspend for coroutines

### Collections
- Use immutable collections (List, Map, Set)
- Use sequence for large collections
- Use built-in functions (map, filter, reduce)
- Use associate, groupBy, partition

### Coroutines
- Use viewModelScope in ViewModels
- Use lifecycleScope in Activities/Fragments
- Use Dispatchers appropriately
- Use CoroutineScope for structured concurrency
- Use withContext for switching dispatchers

## Android/KMP Specific

### Architecture
- Use MVVM or Clean Architecture
- Use Hilt/Dagger for DI
- Use Repository pattern
- Use UseCases for business logic

### Compose
- Use remember and rememberSaveable for state
- Use derivedStateOf for derived state
- Use LaunchedEffect for side effects
- Use rememberCoroutineScope for coroutine scopes
- Use stable annotations for composables

### Testing
- Use JUnit 5
- Use MockK for mocking
- Use Turbine for flow testing
- Use InstantTaskExecutorRule for LiveData testing
