-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2020 a las 20:02:20
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `enajava`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjunto`
--

CREATE TABLE `conjunto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(59) NOT NULL,
  `id_gerencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conjunto`
--

INSERT INTO `conjunto` (`id`, `nombre`, `id_gerencia`) VALUES
(1, 'Recursos humanos, contabilidad, secretaria', 1),
(2, 'Supervisores, vendedores, asistentes ', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_conjunto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `id_conjunto`) VALUES
(1, 'Recursos humanos', 1),
(2, 'Contabilidad', 1),
(3, 'Secretaria', 1),
(4, 'Supervisores', 2),
(5, 'Vendedores', 2),
(6, 'Asistentes', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado`
--

CREATE TABLE `encargado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `encargado`
--

INSERT INTO `encargado` (`id`, `nombre`, `id_departamento`) VALUES
(1, 'Hugo Palma', 6),
(2, 'Matias Gimenez', 2),
(3, 'Camila Ramirez', 1),
(4, 'Julio Martinez', 3),
(5, 'Constanza Varela', 4),
(6, 'Pablo Faundez', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerencia`
--

CREATE TABLE `gerencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gerencia`
--

INSERT INTO `gerencia` (`id`, `nombre`) VALUES
(1, 'administracion'),
(2, 'ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimiento`
--

CREATE TABLE `requerimiento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `id_encargado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `requerimiento`
--

INSERT INTO `requerimiento` (`id`, `descripcion`, `estado`, `id_encargado`) VALUES
(1, 'Imprimir papeles administrativos', 0, 1),
(2, 'Llamar al director general', 0, 5),
(3, 'Recargar tinta de impresora ', 0, 4),
(4, 'Suplir recursos básicos', 0, 3),
(5, 'Comprar alimentos para la empresa', 1, 2),
(6, 'Dar mantenimiento a las computadoras ', 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `password`) VALUES
('admin', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conjunto`
--
ALTER TABLE `conjunto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gerencia` (`id_gerencia`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gerencia` (`id_conjunto`);

--
-- Indices de la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `gerencia`
--
ALTER TABLE `gerencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_encargado` (`id_encargado`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conjunto`
--
ALTER TABLE `conjunto`
  ADD CONSTRAINT `conjunto_ibfk_1` FOREIGN KEY (`id_gerencia`) REFERENCES `gerencia` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`id_conjunto`) REFERENCES `conjunto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD CONSTRAINT `encargado_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD CONSTRAINT `requerimiento_ibfk_1` FOREIGN KEY (`id_encargado`) REFERENCES `encargado` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
