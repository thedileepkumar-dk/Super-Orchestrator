# Common Rules — Language Agnostic

**Source:** everything-claude-code  
**Languages:** All

## Coding Style Rules

### Immutability (CRITICAL)
- Always create new objects, never mutate existing ones
- Return new copies with changes applied
- Use immutable data structures

### File Organization
- Many small files over few large ones
- 200-400 lines typical, 800 max
- Organize by feature/domain
- High cohesion, low coupling

### Error Handling
- Handle errors at every level
- Provide user-friendly messages
- Log detailed context
- Never silently swallow errors

### Input Validation
- Validate all user input
- Use schema-based validation
- Fail fast with clear messages
- Never trust external data

## Testing Rules

- Minimum 80% code coverage
- Test-driven development required
- All test types required:
  - Unit tests
  - Integration tests
  - E2E tests for critical flows

## Security Rules

- NO hardcoded secrets
- All inputs validated
- SQL injection prevention
- XSS prevention
- CSRF protection
- Authentication/authorization verified
- Rate limiting on all endpoints

## Git Workflow Rules

### Commit Format
```
<type>: <description>
```
Types: feat, fix, refactor, docs, test, chore, perf, ci

### PR Process
- Analyze full commit history
- Draft comprehensive summary
- Include test plan
- Push with -u flag

## Usage

These rules are automatically applied to all projects.
