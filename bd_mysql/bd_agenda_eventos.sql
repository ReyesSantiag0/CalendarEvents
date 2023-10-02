-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2023 a las 01:05:07
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
(22, 'prueba22', '2023-10-09', '2', 'Virtual', 14),
(27, 'Reunión administrativa', '2023-10-03', 'Barranquilla', 'Virtual', 13),
(28, 'Reunión administrativa', '2023-12-07', 'Botogá', 'Presencial', 13),
(29, 'Primera', '2023-10-02', 'Barranquilla', 'Virtual', 13),
(31, 'Reunión administrativa', '2023-10-04', 'Pasto', 'Virtual', 17),
(32, 'Reunión programadores', '2023-10-02', 'Barranquilla', 'Presencial', 17);

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
(13, 'Santiago', 'josecamilreyes9@gmail.com', 'pbkdf2:sha256:600000$Fo11bCY2H6OB7Jq0$baff6e0d5f7560c5b19b16446841d84d83f05cdc1129aaaa64c1e06066272817'),
(14, '123', 'ejemplo@gmail.com', 'pbkdf2:sha256:600000$ir7gdlclyipMKseU$3ace2963403ce0f30c4fcbef7cc25a53dbf4ce1c5798c937d76050f008cd81d4'),
(15, '123', 'reyes@gmail.com', 'pbkdf2:sha256:600000$nLomAh8rgk6f0xoZ$60dd21f7a04f4eb2a1cbdaf1752209c04868dfa50bed82228f37ba85d081a13d'),
(16, '123', 'pope@gmail.com', 'pbkdf2:sha256:600000$eyYq5F4XnJBTLhTw$5855d63ee34ca128be1cee7e57687e16f4147e6b4400546ca65b01d605043586'),
(17, 'Leidy Lasso', 'leydi@gmail.com', 'pbkdf2:sha256:600000$irLUxGbupnn2oR6w$6550b2a2d4d2a4c6de9b50557eb6e8c4e9ec359cc00a1502c72d19bff7a4b6c8');

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
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
