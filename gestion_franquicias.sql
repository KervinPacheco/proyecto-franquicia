-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2025 a las 02:51:07
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_franquicias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `salario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `cargo`, `salario`) VALUES
(1, 'empleado', '20'),
(2, 'gerente', '25'),
(3, 'administrador', '30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `franquicias`
--

CREATE TABLE `franquicias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 NOT NULL,
  `fecha_apertura` datetime NOT NULL,
  `correo_electronico` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `franquicias`
--

INSERT INTO `franquicias` (`id`, `nombre`, `direccion`, `fecha_apertura`, `correo_electronico`) VALUES
(1, 'motoGP', 'Av. Mendoza', '2025-03-03 00:00:00', 'motopiruteas@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `franquicia_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `producto_codigo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `cedula` int(11) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `cargo_id` varchar(255) NOT NULL,
  `franquicia_id` varchar(255) NOT NULL,
  `fecha_contratacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `nombre`, `apellido`, `cedula`, `telefono`, `cargo_id`, `franquicia_id`, `fecha_contratacion`) VALUES
(1, 'crhis', 'Davila', 0, '04169940826', 'gerente', 'motoGP', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `palabras_claves` varchar(255) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proovedores`
--

CREATE TABLE `proovedores` (
  `id` int(11) NOT NULL,
  `producto_id` varchar(255) NOT NULL,
  `franquicia_id` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `vendedor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedor_vendedor`
--

CREATE TABLE `provedor_vendedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `provedor_id` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id` int(11) NOT NULL,
  `sesion` varchar(255) CHARACTER SET utf8 NOT NULL,
  `personal_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `fecha_inicio` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `personal_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `producto_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `franquicia_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cargo` (`cargo`);

--
-- Indices de la tabla `franquicias`
--
ALTER TABLE `franquicias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`),
  ADD KEY `id_franquicias` (`franquicia_id`),
  ADD KEY `id_productos` (`producto_codigo`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cargo` (`cargo_id`),
  ADD KEY `id_franquicia` (`franquicia_id`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `proovedores`
--
ALTER TABLE `proovedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_franquici` (`franquicia_id`),
  ADD KEY `id_producto` (`producto_id`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `provedor_vendedor`
--
ALTER TABLE `provedor_vendedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provedor_id` (`provedor_id`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_id` (`personal_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_personal` (`personal_id`),
  ADD KEY `nombre_producto` (`producto_id`),
  ADD KEY `id_franqui` (`franquicia_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `franquicias`
--
ALTER TABLE `franquicias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `id_franquicias` FOREIGN KEY (`franquicia_id`) REFERENCES `franquicias` (`nombre`),
  ADD CONSTRAINT `id_productos` FOREIGN KEY (`producto_codigo`) REFERENCES `productos` (`nombre`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `id_cargo` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`cargo`),
  ADD CONSTRAINT `id_franquicia` FOREIGN KEY (`franquicia_id`) REFERENCES `franquicias` (`nombre`);

--
-- Filtros para la tabla `proovedores`
--
ALTER TABLE `proovedores`
  ADD CONSTRAINT `id_franquici` FOREIGN KEY (`franquicia_id`) REFERENCES `franquicias` (`nombre`),
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`nombre`);

--
-- Filtros para la tabla `provedor_vendedor`
--
ALTER TABLE `provedor_vendedor`
  ADD CONSTRAINT `provedor_id` FOREIGN KEY (`provedor_id`) REFERENCES `proovedores` (`nombre`);

--
-- Filtros para la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `personal_id` FOREIGN KEY (`personal_id`) REFERENCES `personal` (`nombre`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `id_franqui` FOREIGN KEY (`franquicia_id`) REFERENCES `franquicias` (`nombre`),
  ADD CONSTRAINT `id_personal` FOREIGN KEY (`personal_id`) REFERENCES `personal` (`nombre`),
  ADD CONSTRAINT `nombre_producto` FOREIGN KEY (`producto_id`) REFERENCES `inventario` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
