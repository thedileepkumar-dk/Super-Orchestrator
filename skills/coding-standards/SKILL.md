# Coding Standards Skill

**Source:** everything-claude-code  
**Category:** Code Quality

## Overview

This skill enforces coding standards and best practices across all languages.

## General Principles

- Immutability over mutability
- Small, focused functions
- Clear naming
- Comments for why, not what
- DRY (Don't Repeat Yourself)

## File Organization

- Group by feature/domain
- Limit file size (200-400 lines)
- Max 800 lines per file
- High cohesion, low coupling

## Error Handling

- Handle errors at every level
- Provide user-friendly messages
- Log detailed context
- Never silently swallow errors

## Testing

- Test-driven development
- 80% minimum coverage
- Unit + Integration + E2E

## Code Review Checklist

- [ ] Follows conventions
- [ ] Functions are small
- [ ] Proper error handling
- [ ] No hardcoded values
- [ ] Readable naming
- [ ] Adequate tests

## Usage

```
Use coding-standards skill to enforce best practices
```
