# Python Rules

**Source:** everything-claude-code

## Python Specific

### Style
- Follow PEP 8
- Use Black for formatting
- Type hints required
- Docstrings for public APIs

### Imports
- Sort with isort
- Avoid wildcard imports
- Relative imports for packages

### Functions
- Type hints for all parameters
- Return type annotations
- Use typing module

### Classes
- Use dataclasses for simple data
- Abstract base classes for interfaces
- Mixins for shared behavior

## Django Specific

- Use Django ORM properly
- Migrations for schema changes
- CBVs for complex views
- Forms for validation

## Testing
- pytest for testing
- fixtures for test data
- factories for model creation
