-- =========================================
-- CREACIÓN DE BASE DE DATOS
-- =========================================

CREATE DATABASE instituto;
USE instituto;

-- =========================================
-- TABLA CURSO
-- =========================================

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel VARCHAR(50),
    descripcion TEXT
);

-- =========================================
-- TABLA HORARIO
-- =========================================

CREATE TABLE horario (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT UNIQUE,
    imagen_horario VARCHAR(255) NOT NULL,
    fecha_subida DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_curso)
        REFERENCES curso(id_curso)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA USUARIO
-- =========================================

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    correo VARCHAR(150) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,

    id_curso INT,

    FOREIGN KEY (id_curso)
        REFERENCES curso(id_curso)
        ON DELETE SET NULL
);

-- =========================================
-- TABLA ASIGNATURA
-- =========================================

CREATE TABLE asignatura (
    id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    creditos INT
);

-- =========================================
-- RELACIÓN N:M
-- USUARIO <-> ASIGNATURA
-- =========================================

CREATE TABLE usuario_asignatura (
    id_usuario INT,
    id_asignatura INT,

    PRIMARY KEY (id_usuario, id_asignatura),

    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE,

    FOREIGN KEY (id_asignatura)
        REFERENCES asignatura(id_asignatura)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA NOTAS
-- =========================================

CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,

    id_usuario INT NOT NULL,
    id_asignatura INT NOT NULL,

    nota DECIMAL(4,2) NOT NULL,
    fecha DATE,
    observaciones TEXT,

    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE,

    FOREIGN KEY (id_asignatura)
        REFERENCES asignatura(id_asignatura)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA FALTAS
-- =========================================

CREATE TABLE faltas (
    id_falta INT AUTO_INCREMENT PRIMARY KEY,

    id_usuario INT NOT NULL,
    id_asignatura INT NOT NULL,

    fecha DATE NOT NULL,
    justificada BOOLEAN DEFAULT FALSE,
    motivo TEXT,

    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE,

    FOREIGN KEY (id_asignatura)
        REFERENCES asignatura(id_asignatura)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA RANKING
-- =========================================

CREATE TABLE ranking (
    id_ranking INT AUTO_INCREMENT PRIMARY KEY,

    id_usuario INT NOT NULL,

    posicion INT,
    puntos INT DEFAULT 0,
    fecha DATE,

    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);

-- =========================================
-- TABLA PREMIOS
-- =========================================

CREATE TABLE premios (
    id_premio INT AUTO_INCREMENT PRIMARY KEY,

    id_ranking INT NOT NULL,

    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha DATE,

    FOREIGN KEY (id_ranking)
        REFERENCES ranking(id_ranking)
        ON DELETE CASCADE
);

-- =========================================
-- DATOS DE EJEMPLO
-- =========================================

INSERT INTO curso (nombre, nivel, descripcion)
VALUES
('1º DAM', 'Grado Superior', 'Desarrollo de Aplicaciones Multiplataforma'),
('2º DAM', 'Grado Superior', 'Segundo curso DAM');

INSERT INTO horario (id_curso, imagen_horario)
VALUES
(1, 'horarios/dam1.png'),
(2, 'horarios/dam2.png');

INSERT INTO usuario
(nombre, apellido1, apellido2, correo, contrasena, id_curso)
VALUES
('Juan', 'Pérez', 'García', 'juan@gmail.com', '1234', 1),
('María', 'López', 'Sánchez', 'maria@gmail.com', '1234', 2);

INSERT INTO asignatura (nombre, descripcion, creditos)
VALUES
('Programación', 'Programación en Java', 6),
('Bases de Datos', 'MySQL y SQL', 5);

INSERT INTO usuario_asignatura
(id_usuario, id_asignatura)
VALUES
(1,1),
(1,2),
(2,1);

INSERT INTO notas
(id_usuario, id_asignatura, nota, fecha)
VALUES
(1,1,8.5,'2026-04-17'),
(1,2,7.0,'2026-04-17'),
(2,1,9.2,'2026-04-17');

INSERT INTO faltas
(id_usuario, id_asignatura, fecha, justificada, motivo)
VALUES
(1,1,'2026-04-10',TRUE,'Médico'),
(2,1,'2026-04-11',FALSE,'');

INSERT INTO ranking
(id_usuario, posicion, puntos, fecha)
VALUES
(1,1,150,'2026-04-17'),
(2,2,120,'2026-04-17');

INSERT INTO premios
(id_ranking, nombre, descripcion, fecha)
VALUES
(1,'Mejor Alumno','Mayor puntuación del mes','2026-04-17');
