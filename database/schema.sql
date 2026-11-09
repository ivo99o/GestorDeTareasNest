DROP TABLE IF EXISTS tareas;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id        SERIAL       PRIMARY KEY,
    nombre    VARCHAR(100) NOT NULL,
    email     VARCHAR(150) NOT NULL UNIQUE,
    password  VARCHAR(255) NOT NULL,
    telefono  VARCHAR(20)
);

CREATE TABLE categorias (
    id      SERIAL      PRIMARY KEY,
    nombre  VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE tareas (
    id                SERIAL       PRIMARY KEY,
    titulo            VARCHAR(150) NOT NULL,
    descripcion       TEXT,
    estado            VARCHAR(20)  NOT NULL DEFAULT 'pendiente'
                      CHECK (estado IN ('pendiente', 'en_progreso', 'completada')),
    fecha_vencimiento DATE,
    usuario_id        INTEGER      NOT NULL
                      REFERENCES usuarios(id) ON DELETE CASCADE,
    categoria_id      INTEGER
                      REFERENCES categorias(id) ON DELETE SET NULL
);
