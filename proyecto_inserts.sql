INSERT INTO cursos (Nombre) VALUES ("Programación"), ("Cocina"), ("Interpretación"), ("Astronomía"), ("Pesca");

DELIMITER $$
CREATE TRIGGER anadir_duracion AFTER INSERT ON lecciones FOR EACH ROW BEGIN UPDATE cursos SET Duracion = (SELECT SUM(Duracion) FROM lecciones WHERE lecciones.Id_curso = cursos.Id) WHERE Id = NEW.Id_curso;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER eliminar_duracion AFTER DELETE ON lecciones FOR EACH ROW BEGIN UPDATE cursos SET Duracion = (SELECT SUM(Duracion) FROM lecciones WHERE lecciones.Id_curso = cursos.Id) WHERE Id = OLD.Id_curso; 
END$$ 
DELIMITER ;

INSERT INTO usuarios (Nombre, Apellidos, Usuario, Contrasena, Rol) VALUES ("Anthony", "Salazar", "mr.salazzar", "198400", "Estudiante"), ("Ivon", "Madrid", "Ivon400", "29392", "Profesor"), ("Victoria", "Jolie", "Vjolie", "1234", "Personal"), ("Pablo", "Caballero", "Pablito1234", "23456", "Estudiante"), ("Victor", "Oliverio", "Oliverio89", "12456", "Profesor");

INSERT INTO lecciones (Id_curso, Nombre, Duracion, Id_profesor) VALUES (1, "HTML", 120, 2), (1, "CSS", 180, 5), (1, "JS", 230, 2), (2, "Técnicas básicas", 100, 2), (2, "Cocina vegana", 400, 2), (2, "Decoración de platos", 150, 5), (2, "Cocina española", 300, 5), (3, "Personajes", 225, 2), (3, "Maquillaje", 87, 5), (3, "Decorado", 170, 2), (3, "Técnicas de interpretación", 340, 5), (4, "Planetas", 290, 2), (4, "Astros", 155, 5), (4, "Galaxias", 310, 2), (5, "Tipos de caña", 130, 5), (5, "Tipos de peces", 260, 5), (5, "Pesca deportiva", 80, 2);

DELIMITER $$
CREATE TRIGGER test BEFORE INSERT ON progreso_estudiante FOR EACH ROW BEGIN SET NEW.Id_curso = (SELECT Id_curso FROM lecciones WHERE lecciones.Id = NEW.Id_leccion);
END$$
DELIMITER ;

INSERT INTO progreso_estudiante (Id_estudiante, Id_leccion, Fecha_final_leccion) VALUES (4, 2, "2021-10-15"), (4, 3, "2021-10-15"), (4, 1, "2021-05-30"), (4, 10, "2023-03-03"), (1, 15, null), (1, 14, "2020-12-28"), (1, 7, null);

/*SELECT c.Nombre, COUNT(l.Id) AS Total_Lecciones, COUNT(pe.Fecha_final_leccion) AS Lecciones_Completadas
FROM cursos c
JOIN lecciones l ON c.Id = l.Id_curso
LEFT JOIN progreso_estudiante pe ON l.Id = pe.Id_leccion AND pe.Id_curso = c.Id AND pe.Id_estudiante = 4
WHERE c.Id = 1
GROUP BY c.Id, c.Nombre;*/