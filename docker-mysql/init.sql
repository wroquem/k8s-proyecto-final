-- Create the main database
CREATE DATABASE IF NOT EXISTS usuarios_db;

-- Create the application user and set the password
CREATE USER IF NOT EXISTS 'user_app'@'%' IDENTIFIED BY 'PasswordSeguro123';

-- Grant all privileges on the new database to the application user
GRANT ALL PRIVILEGES ON usuarios_db.* TO 'user_app'@'%';

-- Ensure privileges are applied
FLUSH PRIVILEGES;

-- Use the new database
USE usuarios_db;


CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO usuarios (nombre, email) VALUES ('Juan Perez', 'juan@example.com'), ('Maria Lopez', 'maria@example.com');