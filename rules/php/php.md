# PHP Rules

**Source:** everything-claude-code

## PHP Specific

### Type Safety
- Use PHP 8+ types (int, string, array, etc.)
- Use union types
- Use mixed type sparingly
- Use return types and parameter types
- Enable strict_types declaration

### Functions
- Use arrow functions (fn())
- Use named arguments
- Use spread operator (...)
- Use variadic functions properly

### Classes
- Use namespacing (PSR-4)
- Use autoloading (Composer)
- Use traits for code reuse
- Use interfaces for contracts
- Use abstract classes when needed

### Arrays
- Use array destructuring
- Use array functions (array_map, array_filter)
- Use null coalescing (??)
- Use spaceship operator (<=>)

### Error Handling
- Use exceptions instead of errors
- Use try-catch blocks
- Use Throwable interface
- Use set_exception_handler

## Laravel Specific

### Architecture
- Use MVC pattern
- Use Eloquent ORM
- Use Service Container
- Use Service Providers
- Use Facades appropriately

### Routes
- Use route groups
- Use resource controllers
- Use middleware
- Use route model binding

### Database
- Use migrations
- Use seeders and factories
- Use query builder (fluent)
- Use Eloquent relationships
- Use scopes

### Testing
- Use PHPUnit
- Use Laravel Dusk for E2E
- Use Mockery for mocking
- Use factories for test data
