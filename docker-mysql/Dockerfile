# Use the official MySQL 8.0 image as the base
FROM mysql:8.0

# Set environment variables for the root password, database, user, and password
# Note: These values are for demonstration; use Kubernetes Secrets in production.
ENV MYSQL_ROOT_PASSWORD=RootPassword456
ENV MYSQL_DATABASE=usuarios_db
ENV MYSQL_USER=user_app
ENV MYSQL_PASSWORD=PasswordSeguro123

# Copy initialization SQL scripts into the entrypoint directory
# Any .sql or .sh files in this directory are run when the container starts for the first time
COPY ./init-scripts/ /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306

# The container will run the default MySQL entrypoint command
CMD ["mysqld"]
