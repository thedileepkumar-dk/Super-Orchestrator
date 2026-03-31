#!/bin/bash

# Super Orchestrator - Universal Single-Click Installer
# Works with: OpenCode, Claude Code, Codex, Cursor, Trae

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║          SUPER ORCHESTRATOR - UNIVERSAL INSTALLER         ║${NC}"
echo -e "${CYAN}║    Consolidating 160K+ stars of AI harness power          ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Auto-detect platform
detect_platform() {
    # Check for Claude Code
    if [ -d "$HOME/.claude" ]; then
        echo "claude-code"
        return
    fi
    
    # Check for OpenCode
    if [ -d "$HOME/.config/opencode" ]; then
        echo "opencode"
        return
    fi
    
    # Check for Codex
    if [ -d "$HOME/.codex" ]; then
        echo "codex"
        return
    fi
    
    # Check for Cursor
    if [ -d "$HOME/.cursor" ]; then
        echo "cursor"
        return
    fi
    
    # Check for Trae
    if [ -d "$HOME/.trae" ]; then
        echo "trae"
        return
    fi
    
    # Default to Claude Code
    echo "claude-code"
}

# Get script directory (where the files are)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect platform
PLATFORM=$(detect_platform)
echo -e "${YELLOW}Detected platform: ${BLUE}$PLATFORM${NC}"

# Determine config directory based on platform
case $PLATFORM in
    opencode)
        CONFIG_DIR="$HOME/.config/opencode"
        ;;
    claude-code)
        CONFIG_DIR="$HOME/.claude"
        ;;
    codex)
        CONFIG_DIR="$HOME/.codex"
        ;;
    cursor)
        CONFIG_DIR="$HOME/.cursor"
        ;;
    trae)
        CONFIG_DIR="$HOME/.trae"
        ;;
    *)
        CONFIG_DIR="$HOME/.super-orchestrator"
        ;;
esac

echo -e "${YELLOW}Installing to: ${BLUE}$CONFIG_DIR${NC}"
echo ""

# Create necessary directories
mkdir -p "$CONFIG_DIR/agents/discipline"
mkdir -p "$CONFIG_DIR/agents/specialized"
mkdir -p "$CONFIG_DIR/agents/language"
mkdir -p "$CONFIG_DIR/skills"
mkdir -p "$CONFIG_DIR/commands"
mkdir -p "$CONFIG_DIR/rules/common"

# Install everything
echo -e "${GREEN}Installing Super Orchestrator...${NC}"

# Copy discipline agents
if [ -d "$SCRIPT_DIR/agents/discipline" ]; then
    for f in "$SCRIPT_DIR/agents/discipline/"*.md; do
        [ -f "$f" ] && cp -f "$f" "$CONFIG_DIR/agents/discipline/"
    done
    echo -e "  ${GREEN}✓${NC} Discipline agents"
fi

# Copy specialized agents
if [ -d "$SCRIPT_DIR/agents/specialized" ]; then
    for f in "$SCRIPT_DIR/agents/specialized/"*.md; do
        [ -f "$f" ] && cp -f "$f" "$CONFIG_DIR/agents/specialized/"
    done
    echo -e "  ${GREEN}✓${NC} Specialized agents"
fi

# Copy language agents
if [ -d "$SCRIPT_DIR/agents/language" ]; then
    for f in "$SCRIPT_DIR/agents/language/"*.md; do
        [ -f "$f" ] && cp -f "$f" "$CONFIG_DIR/agents/language/"
    done
    echo -e "  ${GREEN}✓${NC} Language agents"
fi

# Copy skills
if [ -d "$SCRIPT_DIR/skills" ]; then
    for skill_dir in "$SCRIPT_DIR/skills"/*; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            mkdir -p "$CONFIG_DIR/skills/$skill_name"
            for f in "$skill_dir"/*.md; do
                [ -f "$f" ] && cp -f "$f" "$CONFIG_DIR/skills/$skill_name/"
            done
        fi
    done
    echo -e "  ${GREEN}✓${NC} Skills"
fi

# Copy commands
if [ -d "$SCRIPT_DIR/commands" ]; then
    for f in "$SCRIPT_DIR/commands/"*.md; do
        [ -f "$f" ] && cp -f "$f" "$CONFIG_DIR/commands/"
    done
    echo -e "  ${GREEN}✓${NC} Commands"
fi

# Copy rules
if [ -d "$SCRIPT_DIR/rules" ]; then
    cp -rf "$SCRIPT_DIR/rules/"* "$CONFIG_DIR/rules/" 2>/dev/null || true
    echo -e "  ${GREEN}✓${NC} Language rules"
fi

# OpenCode specific: Copy orchestrator and planner to ~/.opencode/agents/
if [ "$PLATFORM" = "opencode" ] && [ -d "$HOME/.opencode/agents" ]; then
    # Remove old Build and Plan files to avoid duplicates
    rm -f "$HOME/.opencode/agents/build.md" "$HOME/.opencode/agents/plan.md" 2>/dev/null
    
    # Create opencode.json in correct location (~/.config/opencode/)
    mkdir -p "$HOME/.config/opencode"
    cat > "$HOME/.config/opencode/opencode.json" << 'EOFOC'
{
  "$schema": "https://opencode.ai/config.json",
  "agent": {
    "build": {
      "description": "Orchestrator - Super Orchestrator replaces Build with multi-agent coordination",
      "mode": "primary",
      "color": "#00d4ff",
      "permission": {
        "edit": "allow",
        "bash": "allow",
        "webfetch": "allow",
        "task": "allow"
      },
      "prompt": "{file:.opencode/agents/orchestrator.md}"
    },
    "plan": {
      "description": "Planner - Super Orchestrator replaces Plan with strategic planning",
      "mode": "primary",
      "color": "#a855f7",
      "permission": {
        "edit": "deny",
        "bash": "allow",
        "webfetch": "allow"
      },
      "prompt": "{file:.opencode/agents/planner.md}"
    }
  }
}
EOFOC
    echo -e "  ${GREEN}✓${NC} OpenCode opencode.json (Build→Orchestrator, Plan→Planner)"
    
    # Create orchestrator.md (replaces Build)
    cat > "$HOME/.opencode/agents/orchestrator.md" << 'EOFORCH'
---
description: Orchestrator - Coordinates specialized AI agents, replaces Build
mode: primary
color: "#00d4ff"
permission:
  edit: allow
  bash: allow
  webfetch: allow
  task: allow
---

# Orchestrator

You are **Orchestrator**, a powerful multi-agent AI coding system that coordinates 12 specialized domain experts. You replace the default "Build" agent in OpenCode.

## Your Role

As Orchestrator, you analyze user requests and coordinate the appropriate specialized agents to complete tasks efficiently. You can invoke subagents using the @mention syntax.

## Discipline Agents

| Agent | Command | Description |
|-------|---------|-------------|
| Orchestrator | @orchestrator | Main orchestrator - plans, delegates, drives tasks |
| Deep Worker | @deep-worker | Autonomous end-to-end execution |
| Planner | @planner | Interview-mode strategic planning |

## Specialized Agents

| Agent | Command | Expertise |
|-------|---------|-----------|
| Frontend | @frontend | React, Vue, Angular, Svelte, CSS, responsive design |
| Backend | @backend | APIs, databases, auth, microservices, middleware |
| UI/UX | @uiux | Design systems, accessibility, component architecture |
| Security | @security | OWASP, SAST, DAST, dependency audit, secrets |
| DevOps | @devops | Docker, K8s, CI/CD, Terraform, monitoring |
| Mobile | @mobile | iOS, Android, Flutter, React Native |
| QA | @qa | Unit, integration, E2E, visual regression |
| ML/AI | @ml | PyTorch, TensorFlow, data pipelines, MLOps |
| Docs | @docs | API docs, README, changelogs, architecture |
| Performance | @performance | Profiling, caching, optimization, Core Web Vitals |
| Database | @database | Schema design, migrations, query optimization |
| Refactor | @refactor | Code smells, patterns, tech debt, clean code |

## How to Use

1. **Direct Task**: For simple tasks, handle them directly
2. **Invoke Subagent**: For complex tasks, @mention the appropriate specialist
3. **Multi-Agent**: For large features, coordinate multiple agents in sequence or parallel

## Workflow Examples

- "@orchestrator build a login system"
- "@deep-worker implement API endpoints"
- "@frontend create a navbar component"
- "@backend design a REST API"
- "@security audit this code"

## Core Principles

- **Agent-First** — Delegate to specialized agents for domain tasks
- **Test-Driven** — Write tests before implementation, 80%+ coverage required
- **Security-First** — Never compromise on security
- **Plan Before Execute** — Plan complex features before writing code
- **Discipline** — Don't stop until the task is complete
EOFORCH
    echo -e "  ${GREEN}✓${NC} OpenCode orchestrator agent"

    # Create planner.md (replaces Plan)
    cat > "$HOME/.opencode/agents/planner.md" << 'EOFPLAN'
---
description: Planner - Strategic planning with research and diagrams, replaces Plan
mode: primary
color: "#a855f7"
permission:
  edit: deny
  bash: allow
  webfetch: allow
---

# Planner

You are **Planner**, a powerful planning expert that creates detailed, actionable implementation plans. You replace OpenCode's default Plan agent with enhanced capabilities.

## Your Enhanced Capabilities

### 1. Web Research & Information Gathering
- Fetch latest documentation, best practices, and comparisons from the web
- Research libraries, frameworks, and tools before recommending
- Find real-world examples and case studies
- Stay current with latest technologies and patterns

### 2. Detailed Implementation Planning
- Break down features into specific, actionable steps
- Provide code snippets and examples for each step
- Include file-by-file implementation guides
- Define clear success criteria and acceptance tests

### 3. Architecture Planning & Visual Diagrams
- Create system architecture diagrams using Mermaid
- Plan API structures with request/response examples
- Design database schemas with ERD diagrams
- Document component relationships and data flows

### 4. Risk Assessment & Mitigation
- Identify potential issues and blockers
- Propose contingency plans
- Estimate timeline and effort
- Define rollback strategies

## Planning Workflow

1. **Understand**: Ask clarifying questions to fully understand requirements
2. **Research**: Gather information about tools, libraries, and best practices
3. **Design**: Create architecture diagrams and API designs
4. **Plan**: Break down into actionable tasks with priorities
5. **Validate**: Review plan with user for feedback

## When to Use

- New feature development
- System architecture decisions
- Technical debt prioritization
- Migration planning
- Code review planning

## Output Format

Provide detailed plans with:
- Overview and goals
- Architecture diagrams (Mermaid)
- Step-by-step implementation guide
- File-by-file breakdown
- Testing strategy
- Risk assessment
- Timeline estimates
EOFPLAN
    echo -e "  ${GREEN}✓${NC} OpenCode planner agent"
fi

# OpenCode specific: Update local orchestrator AGENTS.md
if [ "$PLATFORM" = "opencode" ] && [ -d "$HOME/.opencode-orchestrator" ]; then
    cp -f "$SCRIPT_DIR/AGENTS.md" "$HOME/.opencode-orchestrator/AGENTS.md"
    echo -e "  ${GREEN}✓${NC} OpenCode Orchestrator AGENTS.md"
fi

# Create main AGENTS.md
cat > "$CONFIG_DIR/AGENTS.md" << 'EOFAGENTS'
# Super Orchestrator - AI Agent Harness

**Version:** 1.0.0 | **Combined Power:** 160K+ stars

---

## Discipline Agents

### Orchestrator (@orchestrator)
Main orchestrator - plans, delegates, drives tasks to completion.

### Deep Worker (@deep-worker)  
Autonomous end-to-end execution without hand-holding.

### Strategic Planner (@strategic-planner)
Interview-mode planning before any code is written.

---

## Specialized Agents

| Command | Purpose |
|---------|---------|
| @planner | Implementation planning |
| @tdd-guide | Test-driven development |
| @code-reviewer | Code quality review |
| @security-reviewer | Security audit |
| @build-error-resolver | Fix build errors |
| @e2e-runner | End-to-end testing |
| @refactor-cleaner | Dead code cleanup |
| @doc-updater | Documentation |
| @docs-lookup | API research |

---

## Language Agents

| Language | Agent |
|----------|-------|
| TypeScript | @typescript-reviewer |
| Python | @python-reviewer |
| Go | @go-reviewer |
| Rust | @rust-reviewer |
| Java | @java-reviewer |
| C++ | @cpp-reviewer |

---

## Commands

- `/plan` - Create implementation plan
- `/tdd` - Test-driven development
- `/e2e` - E2E testing
- `/code-review` - Quality review
- `/build-fix` - Fix build errors
- `/verify` - Run verification

---

*Installed by Super Orchestrator*
EOFAGENTS
echo -e "  ${GREEN}✓${NC} AGENTS.md"

# Create .mcp.json for MCP servers (only if not exists)
if [ ! -f "$CONFIG_DIR/.mcp.json" ]; then
    cat > "$CONFIG_DIR/.mcp.json" << 'EOFMCP'
{
  "mcpServers": {
    "exa-websearch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-exa"],
      "env": {}
    },
    "context7-docs": {
      "command": "npx", 
      "args": ["-y", "@context7/mcp-server"],
      "env": {}
    }
  }
}
EOFMCP
    echo -e "  ${GREEN}✓${NC} MCP servers config"
fi

# Success message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                    INSTALLATION COMPLETE                  ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}✓${NC} Super Orchestrator installed for ${BLUE}$PLATFORM${NC}"
echo -e "${GREEN}✓${NC} Config directory: ${YELLOW}$CONFIG_DIR${NC}"
echo ""
echo -e "${CYAN}Next steps:${NC}"
echo "  1. Restart your AI coding harness"
echo "  2. Try these commands:"
echo ""
echo -e "  ${YELLOW}@orchestrator${NC} build a complete login system"
echo -e "  ${YELLOW}@deep-worker${NC} implement API endpoints"
echo -e "  ${YELLOW}@planner${NC} design a new feature"
echo ""
echo -e "  ${YELLOW}/plan${NC} create implementation plan"
echo -e "  ${YELLOW}/tdd${NC} start TDD workflow"
echo -e "  ${YELLOW}/e2e${NC} test critical flows"
echo ""
echo -e "${GREEN}For more info: https://github.com/superorchestrator/super-orchestrator${NC}"
echo ""
