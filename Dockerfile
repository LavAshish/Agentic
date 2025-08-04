# Use official Python image as base
FROM python:3.13.2-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Set working directory
WORKDIR /app

# Copy uv dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies using uv
RUN uv sync --frozen --no-dev

# Copy application code
COPY . .

# Expose port (matches the port used in server.py)
EXPOSE 5000

# Set environment variables for better logging
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app
ENV LOG_LEVEL=INFO
ENV UVICORN_LOG_LEVEL=WARNING
ENV FILTER_HEALTH_CHECKS=true

# Health check for Kubernetes
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD python -c "import requests; requests.get('http://localhost:5000/health', timeout=5)" || exit 1

# Start the MCP server
CMD ["uv", "run", "python", "app/server.py"]