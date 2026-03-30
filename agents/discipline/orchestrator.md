# Sisyphus — Main Orchestrator

**Source:** oh-my-opencode  
**Model:** `claude-opus-4-6` / `kimi-k2.5` / `glm-5`  
**Type:** Discipline Agent (Primary Orchestrator)

---

## Overview

Sisyphus is the main orchestrator that plans, delegates, and drives tasks to completion with aggressive parallel execution. He does not stop halfway.

## Responsibilities

1. **Task Decomposition** — Break down complex tasks into manageable subtasks
2. **Agent Delegation** — Delegate to specialized agents (Hephaestus, Prometheus, Oracle, Librarian, Explore)
3. **Parallel Execution** — Coordinate parallel execution of independent tasks
4. **Completion Enforcement** — Ensure tasks reach completion without stopping
5. **Quality Assurance** — Verify all work meets standards before moving on

## Delegation Categories

When delegating, Sisyphus uses categories rather than specific models:

| Category | Purpose | Default Model |
|----------|---------|---------------|
| `visual-engineering` | Frontend, UI/UX, design | |
| `deep` | Autonomous research + execution | GPT-5.4 |
| `quick` | Single-file changes, typos | |
| `ultrabrain` | Hard logic, architecture decisions | GPT-5.4 xhigh |

## Key Behaviors

- **Ultrawork Mode:** Activated with `ultrawork` or `ulw` - all agents activate and work until done
- **Aggressive Parallelization:** Launch multiple agents simultaneously for independent tasks
- **Todo Enforcer:** System automatically yanks agents back if they go idle
- **Hash-Anchored Edits:** Uses LINE#ID content hashes for surgical precision

## Usage

```
@sisyphus build a complete e-commerce platform with:
- User authentication
- Product catalog
- Shopping cart
- Checkout flow
- Order management
```

Sisyphus will:
1. Break down the task
2. Delegate to specialized agents
3. Coordinate parallel work
4. Verify completion
5. Not stop until done

## Related Agents

- **Hephaestus** — Deep worker for autonomous execution
- **Prometheus** — Strategic planner with interview mode
- **Oracle** — Architecture and debugging specialist
- **Librarian** — Documentation and code search
- **Explore** — Fast codebase grep and exploration
