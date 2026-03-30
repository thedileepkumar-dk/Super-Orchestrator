# Super Orchestrator - Universal Single-Click Installer (Windows)
# Works with: OpenCode, Claude Code, Codex, Cursor, Trae

# Colors for PowerShell
$GREEN = "`e[0;32m"
$YELLOW = "`e[1;33m"
$BLUE = "`e[0;34m"
$CYAN = "`e[0;36m"
$NC = "`e[0m"

Write-Host ""
Write-Host "$CYAN╔════════════════════════════════════════════════════════════╗$NC"
Write-Host "$CYAN║          SUPER ORCHESTRATOR - UNIVERSAL INSTALLER         ║$NC"
Write-Host "$CYAN║    Consolidating 160K+ stars of AI harness power          ║$NC"
Write-Host "$CYAN╚════════════════════════════════════════════════════════════╝$NC"
Write-Host ""

# Auto-detect platform
function Detect-Platform {
    if (Test-Path "$env:USERPROFILE\.claude") {
        return "claude-code"
    }
    if (Test-Path "$env:USERPROFILE\.config\opencode") {
        return "opencode"
    }
    if (Test-Path "$env:USERPROFILE\.codex") {
        return "codex"
    }
    if (Test-Path "$env:USERPROFILE\.cursor") {
        return "cursor"
    }
    if (Test-Path "$env:USERPROFILE\.trae") {
        return "trae"
    }
    # Default to Claude Code
    return "claude-code"
}

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Detect platform
$Platform = Detect-Platform
Write-Host "$YELLOW Detected platform: $BLUE$Platform$NC"

# Determine config directory based on platform
switch ($Platform) {
    "opencode" { $ConfigDir = "$env:USERPROFILE\.config\opencode" }
    "claude-code" { $ConfigDir = "$env:USERPROFILE\.claude" }
    "codex" { $ConfigDir = "$env:USERPROFILE\.codex" }
    "cursor" { $ConfigDir = "$env:USERPROFILE\.cursor" }
    "trae" { $ConfigDir = "$env:USERPROFILE\.trae" }
    default { $ConfigDir = "$env:USERPROFILE\.super-orchestrator" }
}

Write-Host "$YELLOW Installing to: $BLUE$ConfigDir$NC"
Write-Host ""

# Create necessary directories
$Dirs = @("agents\discipline", "agents\specialized", "agents\language", "skills", "commands", "rules\common")

foreach ($dir in $Dirs) {
    $fullPath = Join-Path $ConfigDir $dir
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
    }
}

# Install everything
Write-Host "$GREEN Installing Super Orchestrator...$NC"

# Copy discipline agents
$disciplineDest = Join-Path $ConfigDir "agents\discipline"
if (Test-Path "$ScriptDir\agents\discipline") {
    Copy-Item -Path "$ScriptDir\agents\discipline\*.md" -Destination $disciplineDest -Force -ErrorAction SilentlyContinue
    Write-Host "  ${GREEN}✓${NC} Discipline agents"
}

# Copy specialized agents
$specializedDest = Join-Path $ConfigDir "agents\specialized"
if (Test-Path "$ScriptDir\agents\specialized") {
    Copy-Item -Path "$ScriptDir\agents\specialized\*.md" -Destination $specializedDest -Force -ErrorAction SilentlyContinue
    Write-Host "  ${GREEN}✓${NC} Specialized agents"
}

# Copy language agents
$languageDest = Join-Path $ConfigDir "agents\language"
if (Test-Path "$ScriptDir\agents\language") {
    Copy-Item -Path "$ScriptDir\agents\language\*.md" -Destination $languageDest -Force -ErrorAction SilentlyContinue
    Write-Host "  ${GREEN}✓${NC} Language agents"
}

# Copy skills
$skillsDest = Join-Path $ConfigDir "skills"
if (Test-Path "$ScriptDir\skills") {
    Copy-Item -Path "$ScriptDir\skills" -Destination $skillsDest -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  ${GREEN}✓${NC} Skills"
}

# Copy commands
$commandsDest = Join-Path $ConfigDir "commands"
if (Test-Path "$ScriptDir\commands") {
    Copy-Item -Path "$ScriptDir\commands\*.md" -Destination $commandsDest -Force -ErrorAction SilentlyContinue
    Write-Host "  ${GREEN}✓${NC} Commands"
}

# Copy rules
$rulesDest = Join-Path $ConfigDir "rules"
if (Test-Path "$ScriptDir\rules") {
    if (-not (Test-Path $rulesDest)) { New-Item -ItemType Directory -Path $rulesDest -Force | Out-Null }
    Copy-Item -Path "$ScriptDir\rules\*" -Destination $rulesDest -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  ${GREEN}✓${NC} Language rules"
}

# Create main AGENTS.md
$agentsMd = Join-Path $ConfigDir "AGENTS.md"
$agentsContent = @"
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
"@

Set-Content -Path $agentsMd -Value $agentsContent -Force
Write-Host "  ${GREEN}✓${NC} AGENTS.md"

# Create .mcp.json if not exists
$mcpJson = Join-Path $ConfigDir ".mcp.json"
if (-not (Test-Path $mcpJson)) {
    $mcpContent = @"
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
"@
    Set-Content -Path $mcpJson -Value $mcpContent -Force
    Write-Host "  ${GREEN}✓${NC} MCP servers config"
}

# Success message
Write-Host ""
Write-Host "$GREEN╔════════════════════════════════════════════════════════════╗$NC"
Write-Host "$GREEN║                    INSTALLATION COMPLETE                  ║$NC"
Write-Host "$GREEN╚════════════════════════════════════════════════════════════╝$NC"
Write-Host ""
Write-Host "$GREEN✓${NC} Super Orchestrator installed for $BLUE$Platform$NC"
Write-Host "$GREEN✓${NC} Config directory: $YELLOW$ConfigDir$NC"
Write-Host ""
Write-Host "$CYAN Next steps:$NC"
Write-Host "  1. Restart your AI coding harness"
Write-Host "  2. Try these commands:"
Write-Host ""
Write-Host "  $YELLOW@orchestrator$NC build a complete login system"
Write-Host "  $YELLOW@deep-worker$NC implement API endpoints"
Write-Host "  $YELLOW@planner$NC design a new feature"
Write-Host ""
Write-Host "  $YELLOW/plan$NC create implementation plan"
Write-Host "  $YELLOW/tdd$NC start TDD workflow"
Write-Host "  $YELLOW/e2e$NC test critical flows"
Write-Host ""
Write-Host "$GREEN For more info: https://github.com/superorchestrator/super-orchestrator$NC"
Write-Host ""
