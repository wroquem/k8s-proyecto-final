FROM python:3.11-slim

# Crear usuario y grupo de sistema
RUN addgroup --system appgroup && adduser --system appuser --ingroup appgroup

WORKDIR /app

# Instalar dependencias de sistema para mysql
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Instalar librerías de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código fuente
COPY --chown=appuser:appgroup app.py .

# Seguridad: Cambiar a usuario no-root
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]