# Session Start Hook

**Source:** Super Orchestrator  
**Trigger:** When a new session starts

## Purpose

Initialize the session with necessary context and setup.

## What It Does

1. Load project context
2. Check for existing AGENTS.md
3. Load language-specific rules
4. Initialize MCP connections

## Usage

This hook runs automatically when a new session starts.
