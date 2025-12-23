# Use the official MySQL 8.0 image as the base
FROM mysql:8.0

# Set environment variables for the root password, database, user, and password
# Note: These values are for demonstration; use Kubernetes Secrets in production.
ENV MYSQL_ROOT_PASSWORD=RootPassword456
ENV MYSQL_DATABASE=usuarios_db
ENV MYSQL_USER=user_app
ENV MYSQL_PASSWORD=PasswordSeguro123

# Copy the initialization SQL script into the container's init directory
COPY ./sql-scripts/init.sql /docker-entrypoint-initdb.d/
