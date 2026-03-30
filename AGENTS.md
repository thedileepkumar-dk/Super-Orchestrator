# Super Orchestrator — Agent Instructions

**Version:** 1.0.0  
**Combined Power:** 160K+ stars (oh-my-opencode + everything-claude-code)  
**Platforms:** OpenCode | Claude Code | Codex | Cursor | Trae

---

## Overview

Super Orchestrator consolidates the most powerful AI agent harness systems into one unified platform:

| Source | Stars | Key Contributions |
|--------|-------|------------------|
| **oh-my-opencode** | 44.8K | Discipline agents (Sisyphus, Hephaestus, Prometheus), Ultrawork, Hash-anchored edits |
| **everything-claude-code** | 117K | 30 specialized agents, 135 skills, 60 commands, 12 language rules |
| **Custom** | — | 12 domain experts (Frontend, Backend, Security, DevOps, etc.) |

---

## Core Principles

1. **Agent-First** — Delegate to specialized agents for domain tasks
2. **Test-Driven** — Write tests before implementation, 80%+ coverage required
3. **Security-First** — Never compromise on security; validate all inputs
4. **Immutability** — Always create new objects, never mutate existing ones
5. **Plan Before Execute** — Plan complex features before writing code
6. **Discipline** — Don't stop until the task is complete (Sisyphus philosophy)

---

## Discipline Agents

These are the core orchestrators from oh-my-opencode that drive all other agents.

### Sisyphus — Main Orchestrator

**Purpose:** The primary orchestrator that plans, delegates, and drives tasks to completion with aggressive parallel execution.

**Model:** `claude-opus-4-6` / `kimi-k2.5` / `glm-5`

**Responsibilities:**
- Break down complex tasks into manageable subtasks
- Delegate to specialized agents (Hephaestus, Prometheus, Oracle, Librarian)
- Coordinate parallel execution of independent tasks
- Ensure tasks reach completion without stopping halfway
- Manage the todo enforcement system

**Key Behaviors:**
- Uses `ultrawork` mode for maximum efficiency
- Implements aggressive parallelization when possible
- Delegates by category, not specific models (harness picks the right model)
- Enforces todo completion (system yanks agents back if they go idle)

**Categories for delegation:**
| Category | Purpose | Default Model |
|----------|---------|---------------|
| `visual-engineering` | Frontend, UI/UX, design | |
| `deep` | Autonomous research + execution | GPT-5.4 |
| `quick` | Single-file changes, typos | |
| `ultrabrain` | Hard logic, architecture decisions | GPT-5.4 xhigh |

### Hephaestus — Autonomous Deep Worker

**Purpose:** Autonomous end-to-end execution agent. Give him a goal, not a recipe.

**Model:** `GPT-5.4`

**Responsibilities:**
- Explore the codebase to understand patterns
- Research solutions independently
- Execute end-to-end without hand-holding
- Handle complex, multi-step tasks

**Key Behaviors:**
- Does NOT wait for step-by-step instructions
- Proactively researches and implements solutions
- The "Legitimate Craftsman" - gets things done

### Prometheus — Strategic Planner

**Purpose:** Interview-mode strategic planner that questions, identifies scope, and builds detailed plans.

**Model:** `claude-opus-4-6` / `kimi-k2.5` / `glm-5`

**Responsibilities:**
- Interview the user to understand true requirements
- Identify scope and ambiguities
- Build verified implementation plans
- Consult with Metis on plan quality

**Key Behaviors:**
- Asks clarifying questions before planning
- Documents assumptions and risks
- Produces actionable, detailed plans
- Validates plan with stakeholders

---

## Specialized Agents

These domain experts handle specific tasks efficiently.

### Development Workflow Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| **planner** | Implementation planning | Complex features, refactoring |
| **architect** | System design and scalability | Architectural decisions |
| **tdd-guide** | Test-driven development | New features, bug fixes |
| **code-reviewer** | Code quality and maintainability | After writing/modifying code |
| **security-reviewer** | Vulnerability detection | Before commits, sensitive code |
| **build-error-resolver** | Fix build/type errors | When build fails |
| **e2e-runner** | End-to-end Playwright testing | Critical user flows |
| **refactor-cleaner** | Dead code cleanup | Code maintenance |
| **doc-updater** | Documentation and codemaps | Updating docs |
| **docs-lookup** | Documentation and API reference research | Library/API questions |

### Communication & Operations

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| **chief-of-staff** | Communication triage and drafts | Multi-channel email, Slack |
| **loop-operator** | Autonomous loop execution | Run loops safely, monitor stalls |
| **harness-optimizer** | Harness config tuning | Reliability, cost, throughput |

---

## Language-Specific Agents

| Agent | Language | When to Use |
|-------|----------|-------------|
| **typescript-reviewer** | TypeScript/JavaScript | TS/JS projects |
| **python-reviewer** | Python | Python projects |
| **go-reviewer** | Go | Go projects |
| **rust-reviewer** | Rust | Rust projects |
| **java-reviewer** | Java/Spring Boot | Java projects |
| **kotlin-reviewer** | Kotlin/Android/KMP | Kotlin projects |
| **cpp-reviewer** | C++ | C++ projects |

### Build Error Resolvers

| Agent | Language | When to Use |
|-------|----------|-------------|
| **go-build-resolver** | Go | Go build failures |
| **rust-build-resolver** | Rust | Rust build failures |
| **java-build-resolver** | Java/Maven/Gradle | Java build failures |
| **kotlin-build-resolver** | Kotlin/Gradle | Kotlin build failures |
| **cpp-build-resolver** | C++ | C++ build failures |
| **pytorch-build-resolver** | PyTorch/CUDA | PyTorch training failures |

---

## Agent Orchestration

### When to Use Which Agent

**Complex feature requests:**
```
→ @planner or @prometheus
```

**Code just written/modified:**
```
→ @code-reviewer
```

**Bug fix or new feature:**
```
→ @tdd-guide
```

**Architectural decision:**
```
→ @architect
```

**Security-sensitive code:**
```
→ @security-reviewer
```

**Build failing:**
```
→ @build-error-resolver (or language-specific resolver)
```

**Critical user flows:**
```
→ @e2e-runner
```

**Multi-channel communication:**
```
→ @chief-of-staff
```

**Autonomous loops:**
```
→ @loop-operator
```

### Parallel Execution

Launch multiple agents simultaneously for independent operations:

```
@planner design the API
@frontend create the dashboard
@backend implement the database
```

---

## Security Guidelines

**Before ANY commit:**

- No hardcoded secrets (API keys, passwords, tokens)
- All user inputs validated
- SQL injection prevention (parameterized queries)
- XSS prevention (sanitized HTML)
- CSRF protection enabled
- Authentication/authorization verified
- Rate limiting on all endpoints
- Error messages don't leak sensitive data

**Secret management:**
- NEVER hardcode secrets
- Use environment variables or a secret manager
- Validate required secrets at startup
- Rotate any exposed secrets immediately

**If security issue found:**
1. STOP
2. Use @security-reviewer agent
3. Fix CRITICAL issues
4. Rotate exposed secrets
5. Review codebase for similar issues

---

## Coding Standards

### Immutability (CRITICAL)
Always create new objects, never mutate. Return new copies with changes applied.

### File Organization
- Many small files over few large ones
- 200-400 lines typical, 800 max
- Organize by feature/domain, not by type
- High cohesion, low coupling

### Error Handling
- Handle errors at every level
- Provide user-friendly messages in UI code
- Log detailed context server-side
- Never silently swallow errors

### Input Validation
- Validate all user input at system boundaries
- Use schema-based validation
- Fail fast with clear messages
- Never trust external data

---

## Testing Requirements

**Minimum coverage: 80%**

### Test Types (all required)
1. **Unit tests** — Individual functions, utilities, components
2. **Integration tests** — API endpoints, database operations
3. **E2E tests** — Critical user flows

### TDD Workflow (mandatory)
1. Write test first (RED) — test should FAIL
2. Write minimal implementation (GREEN) — test should PASS
3. Refactor (IMPROVE) — verify coverage 80%+

---

## Hash-Anchored Edits

Super Orchestrator uses hash-anchored editing (from oh-my-opencode):

Every line the agent reads comes back tagged with a content hash:
```
11#VK| function hello() {
22#XJ|   return "world";
33#MB| }
```

**Benefits:**
- Edit by referencing hash tags
- If file changed since last read, hash won't match
- Edit is rejected before corruption
- Zero stale-line errors
- **Success rate: 6.7% → 68.3%**

---

## Commands Reference

| Command | Description |
|---------|-------------|
| `/plan` | Create detailed implementation plan |
| `/tdd` | Test-driven development workflow |
| `/e2e` | Generate E2E tests |
| `/code-review` | Quality review |
| `/build-fix` | Fix build errors |
| `/refactor-clean` | Dead code removal |
| `/learn` | Extract patterns mid-session |
| `/verify` | Run verification loop |
| `/multi-plan` | Multi-agent task decomposition |
| `/multi-execute` | Orchestrated multi-agent workflows |

---

## Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| **OpenCode** | Full | Plugin + agents + hooks |
| **Claude Code** | Full | Full plugin support |
| **Codex** | Full | AGENTS.md + commands |
| **Cursor** | Full | Plugin + rules |
| **Trae** | Full | Compatible |

---

## Additional Resources

- [oh-my-opencode](https://github.com/code-yeongyu/oh-my-openagent) — 44.8K stars
- [everything-claude-code](https://github.com/affaan-m/everything-claude-code) — 117K stars

---

*This AGENTS.md is automatically generated by Super Orchestrator. Last updated: 2026-03-30*
