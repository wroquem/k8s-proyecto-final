# Dockerfile.mysql
FROM mysql:8.0

# Asegurar permisos en los directorios de trabajo
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

USER mysql
EXPOSE 3306