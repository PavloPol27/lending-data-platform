SHELL := /usr/bin/env bash
.DEFAULT_GOAL := help

.PHONY: help
help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "%-20s %s\n", $$1, $$2}'

.PHONY: uv-check
uv-check: ## Check uv is installed
	@command -v uv >/dev/null 2>&1 || (echo "uv not found. Install: curl -LsSf https://astral.sh/uv/install.sh | sh" && exit 1)

.PHONY: setup
setup: uv-check ## Create venv and install dev dependencies
	uv venv
	uv sync --dev

.PHONY: fmt
fmt: ## Format code (ruff)
	uv run ruff format .

.PHONY: lint
lint: ## Lint code (ruff)
	uv run ruff check .

.PHONY: test
test: ## Run tests
	uv run pytest -q

.PHONY: precommit
precommit: ## Run pre-commit hooks on all files
	uv run pre-commit run --all-files
