# /plan — Implementation Planning

**Source:** everything-claude-code  
**Category:** Planning

---

## Description

Create a detailed implementation plan for a feature or task. This command invokes the **planner** agent to break down complex tasks into actionable steps.

## Usage

```
/plan <description of what to build>
```

## Examples

```
/plan user authentication system with JWT tokens

/plan real-time chat feature using WebSockets

/plan migrate from REST to GraphQL API
```

## What the Planner Does

1. **Analyzes Requirements** — Understands what needs to be built
2. **Identifies Scope** — Determines what's in/out of scope
3. **Breaks into Phases** — Divides into logical implementation phases
4. **Identifies Dependencies** — Notes external services, libraries, etc.
5. **Estimates Complexity** — Assesses difficulty and potential issues
6. **Documents Risks** — Highlights areas of concern

## Output Format

The planner produces a structured plan:

```markdown
# Implementation Plan: <Feature Name>

## Overview
Brief description of what this feature accomplishes.

## Scope
### In Scope
- Item 1
- Item 2

### Out of Scope
- Item 1
- Item 2

## Phases

### Phase 1: Foundation
**Duration:** ~X hours
**Tasks:**
- [ ] Task 1
- [ ] Task 2

### Phase 2: Core Implementation
**Duration:** ~X hours
**Tasks:**
- [ ] Task 1
- [ ] Task 2

## Dependencies
- External API: API Name
- Library: Library Name
- Team: Team Name

## Risks & Mitigations
| Risk | Impact | Mitigation |
|------|--------|------------|
| Risk 1 | High | Mitigation strategy |

## Testing Strategy
- Unit tests for X
- Integration tests for Y
- E2E tests for Z
```

## Related Commands

- `/tdd` — Start TDD workflow for implementation
- `/multi-plan` — Multi-agent task decomposition
- `/code-review` — Review the plan
