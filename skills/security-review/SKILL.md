# Security Review Skill

**Source:** everything-claude-code  
**Category:** Security

## Overview

This skill provides comprehensive security review workflows for all code changes.

## Security Checklist

Before any commit, verify:

- [ ] No hardcoded secrets (API keys, passwords, tokens)
- [ ] All user inputs validated
- [ ] SQL injection prevention (parameterized queries)
- [ ] XSS prevention (sanitized HTML)
- [ ] CSRF protection enabled
- [ ] Authentication verified
- [ ] Authorization verified
- [ ] Rate limiting on endpoints
- [ ] Error messages don't leak sensitive data

## Secret Management

- NEVER hardcode secrets
- Use environment variables
- Use secret managers
- Validate secrets at startup
- Rotate exposed secrets immediately

## If Vulnerability Found

1. STOP immediately
2. Fix CRITICAL issues first
3. Rotate any exposed secrets
4. Review codebase for similar issues

## Usage

```
Use security-review skill to audit the code
```
