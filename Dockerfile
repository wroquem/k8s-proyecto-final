FROM node:20-alpine

# Crear un grupo y usuario para no usar root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copiar archivos y cambiar el dueño al usuario creado
COPY --chown=appuser:appgroup package*.json ./
RUN npm install --only=production
COPY --chown=appuser:appgroup . .

# Cambiar al usuario no privilegiado
USER appuser

EXPOSE 3000
CMD ["node", "index.js"]