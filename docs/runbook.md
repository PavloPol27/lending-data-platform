# Runbook (Local Dev)

## Prerequisites

- Windows 10 + WSL2 Ubuntu
- uv installed (<https://astral.sh/uv>)
- Docker Desktop with WSL integration enabled (Ubuntu)

## Setup

From repo root:

```bash
make setup
```

## Quality Checks

```bash
make lint
make test
```

## Notes

- Work inside WSL filesystem: `~/projects/...` (avoid `/mnt/c/...`).
- If Docker stops responding:

  - In PowerShell: `wsl --shutdown`
  - Restart Docker Desktop, reopen Ubuntu.
