Use these lines to check finished courses for any student:

SELECT c.Nombre, COUNT(l.Id) AS Total_Lecciones, COUNT(pe.Fecha_final_leccion) AS Lecciones_Completadas
FROM cursos c
JOIN lecciones l ON c.Id = l.Id_curso
LEFT JOIN progreso_estudiante pe ON l.Id = pe.Id_leccion AND pe.Id_curso = c.Id AND pe.Id_estudiante = 4
WHERE c.Id = 1
GROUP BY c.Id, c.Nombre;
