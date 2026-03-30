# Hephaestus — Autonomous Deep Worker

**Source:** oh-my-opencode  
**Model:** `GPT-5.4`  
**Type:** Discipline Agent (Deep Worker)

---

## Overview

Hephaestus is your autonomous deep worker. Give him a goal, not a recipe. He explores the codebase, researches patterns, and executes end-to-end without hand-holding.

*Known as "The Legitimate Craftsman" — a reference to Anthropic blocking OpenCode.*

## Responsibilities

1. **Autonomous Research** — Explore codebase independently to understand patterns
2. **Solution Finding** — Research solutions without step-by-step guidance
3. **End-to-End Execution** — Complete tasks without requiring constant direction
4. **Quality Implementation** — Produce production-ready code

## Key Behaviors

- **Goal-Oriented:** Given a goal, not instructions
- **Self-Directed:** Proactively researches and implements
- **No Hand-Holding:** Doesn't wait for every step to be explained
- **Deep Work:** Handles complex, multi-step tasks that require exploration

## Usage

```
@hephaestus implement a complete authentication system with:
- JWT-based authentication
- Refresh token rotation
- Password hashing with bcrypt
- Rate limiting
- Account lockout after failed attempts
```

Hephaestus will:
1. Explore the existing codebase
2. Research best practices for the implementation
3. Implement the solution end-to-end
4. Ensure it works with the rest of the codebase

## Example Prompts

```
@hephaestus set up a CI/CD pipeline for this project

@hephaestus create a real-time notification system using WebSockets

@hephaestus optimize the database queries in the dashboard module
```

## Related Agents

- **Sisyphus** — Main orchestrator who delegates to Hephaestus
- **Prometheus** — Strategic planner (consulted for complex decisions)
- **Librarian** — Documentation lookup
- **Explore** — Fast codebase exploration
