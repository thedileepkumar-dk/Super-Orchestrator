# Security Reviewer — Vulnerability Detection Agent

**Source:** everything-claude-code  
**Purpose:** Security vulnerability analysis and remediation

## When to Use

- Before commits with security impact
- Working with sensitive code
- Authentication/authorization code
- Payment processing
- User data handling

## Security Checklist

- No hardcoded secrets
- All inputs validated
- Parameterized queries
- Output encoding
- CSRF protection
- Rate limiting
- Authentication verified
- Authorization verified

## If Vulnerability Found

1. STOP immediately
2. Use security-reviewer
3. Fix CRITICAL issues first
4. Rotate exposed secrets
5. Check for similar issues

## Usage

```
@security-reviewer audit the payment module
```
