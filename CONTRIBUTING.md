# Contributing to Super Orchestrator

Thank you for your interest in contributing to Super Orchestrator! This guide will help you get started.

---

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Please be respectful and constructive.

---

## How to Contribute

### 1. Fork the Repository

Click the "Fork" button on the top right of the repository page.

### 2. Clone Your Fork

```bash
git clone https://github.com/thedileepkumar-dk/Super-Orchestrator.git
cd Super-Orchestrator
```

### 3. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

### 4. Make Your Changes

- Follow the existing code style
- Add comments for complex logic
- Keep files focused and organized

### 5. Commit Your Changes

```bash
git add .
git commit -m "feat(agents): add new agent for X"
```

#### Commit Message Format

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code refactoring |
| `docs` | Documentation |
| `test` | Tests |
| `chore` | Maintenance |

### 6. Push to GitHub

```bash
git push origin feature/your-feature-name
```

### 7. Open a Pull Request

Go to the original repository and click "New Pull Request".

---

## Types of Contributions

### 🐛 Bug Fixes
- Report bugs using GitHub Issues
- Include steps to reproduce
- Provide environment details

### ✨ New Features
- Add new agents (in `agents/`)
- Add new skills (in `skills/`)
- Add new commands (in `commands/`)
- Add new rules (in `rules/`)

### 📚 Documentation
- Improve README
- Add usage examples
- Create guides

### 🧪 Tests
- Add unit tests
- Add integration tests

---

## Project Structure

```
Super-Orchestrator/
├── agents/
│   ├── discipline/     # Core orchestrator agents
│   ├── specialized/    # Domain-specific agents
│   └── language/       # Language-specific agents
├── skills/            # Development workflow skills
├── commands/          # Slash commands
├── rules/            # Language-specific rules
├── hooks/            # Automation hooks
├── mcp-configs/      # MCP server configs
└── assets/           # Images and resources
```

---

## Adding New Agents

### Agent File Format

```markdown
# Agent Name

**Source:** source-repo
**Purpose:** What the agent does

## When to Use

- Scenario 1
- Scenario 2

## Responsibilities

- Responsibility 1
- Responsibility 2

## Usage

@agent-name do something
```

### Example: `agents/specialized/new-agent.md`

```markdown
# New Agent — Description

**Source:** Super Orchestrator
**Purpose:** Does something amazing

## When to Use

- When you need X
- For Y tasks

## Responsibilities

- Task 1
- Task 2

## Usage

@new-agent do something
```

---

## Adding New Skills

### Skill File Format

Create `skills/skill-name/SKILL.md`:

```markdown
# Skill Name

**Source:** source-repo
**Category:** Category Name

## Overview

Brief description of the skill.

## Key Concepts

- Concept 1
- Concept 2

## Usage

Use this skill by...
```

---

## Adding New Commands

### Command File Format

Create `commands/command-name.md`:

```markdown
# /command-name — Description

**Source:** source-repo
**Category:** Category

## Description

What this command does.

## Usage

/command-name [arguments]
```

---

## Questions?

- Open an [Issue](https://github.com/thedileepkumar-dk/Super-Orchestrator/issues)
- Start a [Discussion](https://github.com/thedileepkumar-dk/Super-Orchestrator/discussions)

---

## Recognition

Contributors will be recognized in:
- README.md contributors section
- GitHub contributors graph

Thank you for contributing! 🎉
