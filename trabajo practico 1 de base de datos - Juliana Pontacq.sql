-- Crear base de datos (opcional)
CREATE DATABASE IF NOT EXISTS plataforma_cursos;
USE plataforma_cursos;

-- Tabla Estudiante
CREATE TABLE Estudiante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Email VARCHAR(100)
);

-- Tabla Instructor
CREATE TABLE Instructor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Email VARCHAR(100)
);

-- Tabla Curso
CREATE TABLE Curso (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    Descripcion TEXT,
    Fecha_Inicio DATE,
    Duracion INT, -- duración en días/semanas
    ID_Instructor INT,
    FOREIGN KEY (ID_Instructor) REFERENCES Instructor(ID)
);

-- Tabla Leccion
CREATE TABLE Leccion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    Contenido TEXT,
    ID_Curso INT,
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID)
);

-- Tabla Inscripcion (relación N:M entre Estudiante y Curso)
CREATE TABLE Inscripcion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Inscripcion DATE,
    ID_Estudiante INT,
    ID_Curso INT,
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID)
);
