# TypeScript Rules

**Source:** everything-claude-code

## TypeScript Specific

### Type Safety
- Enable strict mode
- Use type inference
- Avoid `any`
- Use `unknown` when type is unknown
- Use proper types over type assertions

### Imports
- Use path aliases
- Barrel exports for modules
- Named exports preferred

### Functions
- Type all parameters
- Return types for complex functions
- Use function overloads when needed

### Classes
- Use access modifiers appropriately
- Implement interfaces
- Use abstract classes when needed

## React Specific

### Hooks
- Custom hooks for logic reuse
- useCallback for functions passed to children
- useMemo for expensive computations
- useState for local state

### Components
- Functional components
- Props interfaces
- Memo for expensive components
