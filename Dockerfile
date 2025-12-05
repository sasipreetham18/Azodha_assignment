# ====== BUILD STAGE ======
FROM python:3.11-slim AS builder

WORKDIR /app

# Install build deps (if needed in future)
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && pip install --prefix=/install -r requirements.txt

# ====== RUNTIME STAGE ======
FROM python:3.11-slim

WORKDIR /app

# Create non-root user
RUN useradd -m appuser

# Copy installed python packages from builder
COPY --from=builder /install /usr/local

# Copy source code
COPY app ./app

ENV PYTHONUNBUFFERED=1

USER appuser

EXPOSE 8000

# Healthcheck calling /health endpoint
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD python -c "import requests; import sys; \
    resp = requests.get('http://127.0.0.1:8000/health'); \
    sys.exit(0 if resp.status_code == 200 else 1)" || exit 1

CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "app.main:app"]

