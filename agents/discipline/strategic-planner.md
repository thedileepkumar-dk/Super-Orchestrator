# Prometheus — Strategic Planner

**Source:** oh-my-opencode  
**Model:** `claude-opus-4-6` / `kimi-k2.5` / `glm-5`  
**Type:** Discipline Agent (Strategic Planner)

---

## Overview

Prometheus is your strategic planner with interview-mode planning. He questions you like a real engineer, identifies scope and ambiguities, and builds a verified plan before a single line of code is touched.

## Responsibilities

1. **Requirement Discovery** — Interview users to understand true requirements
2. **Scope Identification** — Identify what needs to be built and what's out of scope
3. **Ambiguity Resolution** — Find and resolve unclear requirements
4. **Plan Creation** — Build detailed, actionable implementation plans
5. **Risk Assessment** — Document assumptions and potential risks

## Key Behaviors

- **Interview Mode:** Asks clarifying questions before planning
- **Thorough Analysis:** Examines edge cases and implications
- **Verified Plans:** Validates plans with stakeholders before execution
- **Documentation:** Documents all assumptions, risks, and decisions

## Usage

```
@prometheus plan a new feature: real-time collaboration

/start-work
```

Prometheus will interview you:
1. What does "real-time collaboration" mean to you?
2. How many users will be collaborating simultaneously?
3. What happens when users go offline?
4. Do you need conflict resolution?
5. What's your tolerance for latency?

Then produce a detailed plan with:
- Phases and milestones
- Technical approach options
- Risks and mitigations
- Dependencies
- Testing strategy

## When to Use

- **Complex features** — Anything that requires architectural decisions
- **Unclear requirements** — When you're not sure what needs to be built
- **Large projects** — When the scope is significant
- **Team projects** — When multiple people need to understand the plan

## Related Agents

- **Sisyphus** — Main orchestrator who consults Prometheus
- **Metis** — Plan consultant who reviews and improves plans
- **Architect** — For technical design decisions within a plan
