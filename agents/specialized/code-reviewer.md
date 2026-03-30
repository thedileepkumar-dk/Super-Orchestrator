# Code Reviewer — Code Quality Agent

**Source:** everything-claude-code  
**Purpose:** Code quality and maintainability reviews

## When to Use

- After writing or modifying code
- Before commits
- During PR reviews
- Before deployments

## Review Checklist

- Code follows project conventions
- Functions are small and focused
- Error handling is present
- No hardcoded values
- Proper naming
- Adequate comments
- Tests are included

## Security Checks

- No hardcoded secrets
- Input validation present
- SQL injection prevention
- XSS prevention

## Usage

```
@code-reviewer review the login module
```
