
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `proyecto`
--

CREATE DATABASE `proyecto`;
USE `proyecto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Duracion` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lecciones`
--

CREATE TABLE `lecciones` (
  `Id` int(11) NOT NULL,
  `Id_curso` int(11) DEFAULT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Duracion` int(7) DEFAULT NULL,
  `Id_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso_estudiante`
--

CREATE TABLE `progreso_estudiante` (
  `Id_estudiante` int(11) DEFAULT NULL,
  `Id_curso` int(11) DEFAULT NULL,
  `Id_leccion` int(11) DEFAULT NULL,
  `Fecha_final_leccion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellidos` varchar(40) DEFAULT NULL,
  `Usuario` varchar(15) DEFAULT NULL,
  `Contrasena` int(16) DEFAULT NULL,
  `Rol` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `lecciones`
--
ALTER TABLE `lecciones`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_cursos_lecciones` (`Id_curso`),
  ADD KEY `fk_usuarios_lecciones` (`Id_profesor`);

--
-- Indices de la tabla `progreso_estudiante`
--
ALTER TABLE `progreso_estudiante`
  ADD KEY `fk_usuarios_progreso` (`Id_estudiante`),
  ADD KEY `fk_cursos_progresos` (`Id_curso`),
  ADD KEY `fk_lecciones_progreso` (`Id_leccion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lecciones`
--
ALTER TABLE `lecciones`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lecciones`
--
ALTER TABLE `lecciones`
  ADD CONSTRAINT `fk_cursos_lecciones` FOREIGN KEY (`Id_curso`) REFERENCES `cursos` (`Id`),
  ADD CONSTRAINT `fk_usuarios_lecciones` FOREIGN KEY (`Id_profesor`) REFERENCES `usuarios` (`Id`);

--
-- Filtros para la tabla `progreso_estudiante`
--
ALTER TABLE `progreso_estudiante`
  ADD CONSTRAINT `fk_cursos_progresos` FOREIGN KEY (`Id_curso`) REFERENCES `cursos` (`Id`),
  ADD CONSTRAINT `fk_lecciones_progreso` FOREIGN KEY (`Id_leccion`) REFERENCES `lecciones` (`Id`),
  ADD CONSTRAINT `fk_usuarios_progreso` FOREIGN KEY (`Id_estudiante`) REFERENCES `usuarios` (`Id`);
COMMIT;
