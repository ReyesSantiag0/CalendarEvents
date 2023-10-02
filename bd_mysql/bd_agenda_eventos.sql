-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2023 a las 21:29:36
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_agenda_eventos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `nombre_evento` varchar(255) NOT NULL,
  `fecha_evento` date NOT NULL,
  `lugar_evento` varchar(255) NOT NULL,
  `modalidad_evento` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `nombre_evento`, `fecha_evento`, `lugar_evento`, `modalidad_evento`, `id_usuario`) VALUES
(38, 'Reunión administrativa', '2023-10-07', 'Barranquilla', 'Virtual', 49),
(39, 'Reunión Desarrolladores', '2023-10-04', 'Pasto', 'Virtual', 49),
(40, 'Reunión administrativa', '2023-10-20', 'Bogotá', 'Virtual', 49),
(41, 'Reunión Desarrolladores', '2023-10-25', 'Bogotá', 'Virtual', 49),
(42, 'Reunión administrativa', '2023-10-05', 'Barranquilla', 'Virtual', 49),
(43, 'Asamblea General', '2023-11-01', 'Medellín', 'Presencial', 49),
(44, 'Reunión administrativa', '2023-10-24', 'Barranquilla', 'Presencial', 49),
(45, 'Asamblea General', '2023-10-31', 'Pasto', 'Presencial', 49),
(46, 'Reunión administrativa', '2023-11-02', 'Cali', 'Presencial', 49),
(47, 'Reunión Desarrolladores', '2023-11-29', 'Cali', 'Presencial', 49),
(48, 'Reunión administrativa', '2023-11-07', 'Barranquilla', 'Virtual', 49),
(49, 'Reunión administrativa', '2023-10-31', 'Barranquilla', 'Virtual', 48),
(50, 'Reunión Desarrolladores', '2023-11-06', 'Pasto', 'Presencial', 48),
(51, 'Asamblea General', '2023-10-16', 'Bogotá', 'Virtual', 48),
(52, 'Reunión administrativa', '2023-10-31', 'Bogotá', 'Presencial', 48),
(53, 'Asamblea General', '2023-11-23', 'Cali', 'Presencial', 48),
(54, 'Reunión Desarrolladores', '2023-11-02', 'Cundinamarca', 'Virtual', 48),
(55, 'Asamblea General', '2023-11-08', 'Bogotá', 'Presencial', 48),
(56, 'Asamblea General', '2023-10-16', 'Pasto', 'Presencial', 48),
(57, 'Asamblea ingeniería de software', '2023-10-18', 'Pasto', 'Virtual', 48),
(59, 'Reunión administrativos', '2023-10-18', 'Cali', 'Virtual', 48),
(60, 'Asamblea General', '2023-10-23', 'Bogotá', 'Presencial', 47),
(61, 'Reunión Desarrolladores', '2023-10-17', 'Bogotá', 'Presencial', 47),
(62, 'Asamblea General', '2023-10-22', 'Bogotá', 'Presencial', 47),
(63, 'Reunión Desarrolladores', '2023-11-14', 'Bogotá', 'Presencial', 47);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `correo_usuario` varchar(255) NOT NULL,
  `contrasena_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo_usuario`, `contrasena_usuario`) VALUES
(47, 'Andrés Zambrano', 'zambrano@gmail.com', 'pbkdf2:sha256:600000$VG2YE1UCFrxJspV0$bf6c5db6fa899b2c18494af295ea959d2384aa1389f5b4c56b172b09b9ec41c2'),
(48, 'Marta Estela', 'marta@gmail.com', 'pbkdf2:sha256:600000$0HLrLrSmHbTUqN7h$fc280c7f83a3fa3aada1dca95d839729cea297b0842ea4ce8f2118adb1f0a952'),
(49, 'Santiago Reyes', 'josecamilreyes9@gmail.com', 'pbkdf2:sha256:600000$RuZQTrlz2iHabnOk$ff2fc7134fc5c563c4ac81b8055e4cd8651e387069d8d9e10421c2ec06711edc');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_persona` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
