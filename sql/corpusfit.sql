-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2024 a las 03:14:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `corpusfit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades_deportivas`
--

CREATE TABLE `actividades_deportivas` (
  `id_actividad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `nivel_dificultad` enum('Básico','Intermedio','Avanzado') NOT NULL,
  `id_instructor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividades_deportivas`
--

INSERT INTO `actividades_deportivas` (`id_actividad`, `nombre`, `descripcion`, `tipo`, `nivel_dificultad`, `id_instructor`) VALUES
(2, 'fge', 'fe', 'ge', 'Intermedio', 13),
(3, 'natacion', 'na', 'ejercicos', 'Intermedio', 1093);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_actividad`
--

CREATE TABLE `asistencia_actividad` (
  `id_asistencia` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `id_sesion` int(11) NOT NULL,
  `fecha_asistencia` date NOT NULL,
  `presente` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencia_actividad`
--

INSERT INTO `asistencia_actividad` (`id_asistencia`, `id_miembro`, `id_sesion`, `fecha_asistencia`, `presente`) VALUES
(1, 1, 1, '2024-11-24', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_general`
--

CREATE TABLE `asistencia_general` (
  `id_asistencia` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `fecha_asistencia` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencia_general`
--

INSERT INTO `asistencia_general` (`id_asistencia`, `id_miembro`, `fecha_asistencia`, `hora_entrada`, `hora_salida`) VALUES
(1, 1, '2024-11-24', '10:44:00', '00:44:00'),
(3, 1, '2024-11-20', '12:00:00', '16:17:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_actividad`
--

CREATE TABLE `horarios_actividad` (
  `id_sesion` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios_actividad`
--

INSERT INTO `horarios_actividad` (`id_sesion`, `id_actividad`, `fecha`, `hora_inicio`, `hora_fin`) VALUES
(1, 2, '2024-11-24', '01:22:00', '02:22:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `fecha_inscripcion` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id_inscripcion`, `id_miembro`, `id_actividad`, `fecha_inscripcion`) VALUES
(1, 1, 2, '2024-11-08'),
(4, 1, 3, '2024-11-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `id_instructor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`id_instructor`, `nombre`, `telefono`, `email`) VALUES
(13, '234245', '31823284', '224@gmaqil.com'),
(1093, 'Angel Ureña', '32420', 'angel@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('cliente','administrador') NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_usuario`, `nombre`, `username`, `password`, `rol`, `fecha_creacion`) VALUES
(1, 'Carlos Mantilla', '1093@gmail.com', '1093', 'administrador', '2024-11-14 20:33:32'),
(3, 'Juan Fernandez', '1094@gmail.com', '1094', 'cliente', '2024-11-18 18:24:08'),
(1094, 'Jose Gómez', 'Soypapu@gmail.com', '1095', 'administrador', '2024-11-27 12:04:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`cedula`, `nombre`, `telefono`, `email`) VALUES
(1, 'Carlos Mantilla', '31823284948', '224@gmaqil.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades_deportivas`
--
ALTER TABLE `actividades_deportivas`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `id_instructor` (`id_instructor`);

--
-- Indices de la tabla `asistencia_actividad`
--
ALTER TABLE `asistencia_actividad`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `id_miembro` (`id_miembro`),
  ADD KEY `id_sesion` (`id_sesion`);

--
-- Indices de la tabla `asistencia_general`
--
ALTER TABLE `asistencia_general`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `id_miembro` (`id_miembro`);

--
-- Indices de la tabla `horarios_actividad`
--
ALTER TABLE `horarios_actividad`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `id_miembro` (`id_miembro`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`id_instructor`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades_deportivas`
--
ALTER TABLE `actividades_deportivas`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `asistencia_actividad`
--
ALTER TABLE `asistencia_actividad`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asistencia_general`
--
ALTER TABLE `asistencia_general`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `horarios_actividad`
--
ALTER TABLE `horarios_actividad`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `instructores`
--
ALTER TABLE `instructores`
  MODIFY `id_instructor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1094;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1095;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades_deportivas`
--
ALTER TABLE `actividades_deportivas`
  ADD CONSTRAINT `actividades_deportivas_ibfk_1` FOREIGN KEY (`id_instructor`) REFERENCES `instructores` (`id_instructor`) ON DELETE SET NULL;

--
-- Filtros para la tabla `asistencia_actividad`
--
ALTER TABLE `asistencia_actividad`
  ADD CONSTRAINT `asistencia_actividad_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`cedula`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencia_actividad_ibfk_2` FOREIGN KEY (`id_sesion`) REFERENCES `horarios_actividad` (`id_sesion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `asistencia_general`
--
ALTER TABLE `asistencia_general`
  ADD CONSTRAINT `asistencia_general_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`cedula`) ON DELETE CASCADE;

--
-- Filtros para la tabla `horarios_actividad`
--
ALTER TABLE `horarios_actividad`
  ADD CONSTRAINT `horarios_actividad_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividades_deportivas` (`id_actividad`) ON DELETE CASCADE;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`cedula`) ON DELETE CASCADE,
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_actividad`) REFERENCES `actividades_deportivas` (`id_actividad`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
