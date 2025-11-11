SHELL := /bin/bash

setup:
	@echo "Installing uv python package manager..."
	curl -LsSf https://astral.sh/uv/install.sh | sh
	@echo "✅ Installed uv. Please run: source ~/.bashrc or restart your shell"
	@echo "🔁 Then re-run: make setup"
	@echo "Initializing uv..."
	uv init
	@echo "Creating virtual environment..."
	uv venv
	@echo "Activating virtual environment..."
	# source .venv/bin/activate
	@echo "Installing required packages..."
	uv add -r requirements.txt
	@echo "Setup complete. Dependencies successfully installed."

server:
	@echo "✅ Ensure that you have run \"make setup\" 2️⃣ [twice]"
	@echo "Starting MCP server..."
	DANGEROUSLY_OMIT_AUTH=true PYTHONPATH=. uv run mcp dev app/server.py

templates:
	@echo "Generating templates..."
	./helm/scripts/export.sh

help:
	@echo "Available commands:"
	@echo "  make setup - Install uv and dependencies"
	@echo "  make server - Run the MCP server"
	@echo "  make help  - Show this help message"