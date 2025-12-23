CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO usuarios (nombre, email) VALUES ('Juan Perez', 'juan@example.com'), ('Maria Lopez', 'maria@example.com');