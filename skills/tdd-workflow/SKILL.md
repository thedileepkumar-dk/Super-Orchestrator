# TDD Workflow Skill

**Source:** everything-claude-code  
**Category:** Development Workflow

---

## Overview

This skill implements Test-Driven Development (TDD) methodology. TDD is mandatory for all new features and bug fixes with a minimum 80% code coverage requirement.

## The TDD Cycle

```
┌─────────────────────────────────────────────────────────────┐
│                      TDD WORKFLOW                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌─────────┐     ┌─────────────┐     ┌────────────────┐  │
│   │  RED    │ ──► │   GREEN     │ ──► │    IMPROVE     │  │
│   │ Write   │     │ Write       │     │ Refactor       │  │
│   │ failing │     │ minimal     │     │ & verify       │  │
│   │ test    │     │ passing     │     │ coverage       │  │
│   └─────────┘     └─────────────┘     └────────────────┘  │
│       │               │                      │             │
│       └───────────────┴──────────────────────┘             │
│                         │                                    │
│                         ▼                                    │
│                  ┌────────────┐                             │
│                  │   REPEAT   │                             │
│                  │   until    │                             │
│                  │  complete  │                             │
│                  └────────────┘                             │
└─────────────────────────────────────────────────────────────┘
```

## Step 1: RED — Write Failing Test

1. **Analyze the requirement** — Understand what needs to be implemented
2. **Write the test first** — The test should describe the desired behavior
3. **Run the test** — It MUST fail (this validates the test is checking the right thing)

### Test Structure

```typescript
// Example: Testing a user registration function

describe('UserRegistration', () => {
  describe('register', () => {
    it('should create a new user with valid email and password', () => {
      // Arrange
      const email = 'user@example.com';
      const password = 'SecurePass123!';

      // Act
      const user = register(email, password);

      // Assert
      expect(user).toBeDefined();
      expect(user.email).toBe(email);
      expect(user.id).toBeDefined();
    });

    it('should throw error for invalid email', () => {
      // Arrange
      const email = 'invalid-email';
      const password = 'SecurePass123!';

      // Act & Assert
      expect(() => register(email, password)).toThrow('Invalid email');
    });

    it('should throw error for weak password', () => {
      // Arrange
      const email = 'user@example.com';
      const password = 'weak';

      // Act & Assert
      expect(() => register(email, password)).toThrow('Password too weak');
    });
  });
});
```

## Step 2: GREEN — Write Minimal Passing Code

1. **Write the simplest code** that makes the test pass
2. **Don't over-engineer** — Just enough to pass the test
3. **Focus on one test at a time**
4. **All previous tests must still pass**

### Example Implementation

```typescript
// Minimal implementation to pass the first test
function register(email: string, password: string): User {
  if (!email.includes('@')) {
    throw new Error('Invalid email');
  }
  if (password.length < 8) {
    throw new Error('Password too weak');
  }

  return {
    id: crypto.randomUUID(),
    email,
    createdAt: new Date()
  };
}
```

## Step 3: IMPROVE — Refactor

1. **Refactor the code** — Improve structure, remove duplication
2. **Run all tests** — Ensure everything still passes
3. **Verify coverage** — Target 80%+ coverage
4. **Repeat** — Move to the next test

### Coverage Requirements

| Type | Minimum Coverage |
|------|------------------|
| Unit Tests | 80% |
| Integration Tests | Required for APIs |
| E2E Tests | Required for critical flows |

## Testing Best Practices

### Test Naming

Use descriptive names that explain what is being tested:

```typescript
// Good
it('should return 404 when user does not exist')

// Bad
it('test1')
```

### Test Structure (AAA Pattern)

```typescript
describe('FeatureName', () => {
  describe('behavior', () => {
    it('should do something specific', () => {
      // Arrange - Set up test data and conditions
      const input = createTestData();

      // Act - Execute the behavior being tested
      const result = executeBehavior(input);

      // Assert - Verify the expected outcome
      expect(result).toMatchSnapshot();
    });
  });
});
```

### Test Isolation

- Each test should be independent
- Tests can run in any order
- Clean up after each test
- Use mocks for external dependencies

## Troubleshooting

### Test fails unexpectedly
1. Check test isolation
2. Verify mocks are set up correctly
3. Check for shared state between tests

### Coverage too low
1. Identify untested branches
2. Add edge case tests
3. Test error handling paths

### Tests are slow
1. Mock expensive operations
2. Use test databases
3. Parallelize where possible

## Commands

This skill works with the following commands:

- `/tdd` — Start TDD workflow
- `/test-coverage` — Analyze test coverage
- `/e2e` — Generate E2E tests

## Related Skills

- [e2e-testing](./e2e-testing/SKILL.md) — End-to-end testing patterns
- [python-testing](./python-testing/SKILL.md) — Python-specific testing
- [verification-loop](./verification-loop/SKILL.md) — Continuous verification
