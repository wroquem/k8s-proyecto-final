CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);


INSERT INTO usuarios (nombre, email) VALUES ('Juan Perez', 'juan@example.com'), ('Maria Lopez', 'maria@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Warren Roque', 'warren@example.com'), ('Mery Maguina', 'mery@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Facundo Rodriguez', 'Facundo@example.com'), ('Julian Martinez', 'Julian@example.com');
INSERT INTO usuarios (nombre, email) VALUES ('Emilio Cortez', 'Emilio@example.com'), ('Justo Lopez', 'justo@example.com');
