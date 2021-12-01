-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-12-2021 a las 03:24:56
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iss`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `categoria`) VALUES
(4, 'Mariscos'),
(5, 'Res'),
(6, 'Embutidos'),
(7, 'Lacteos'),
(8, 'Abarrotes'),
(9, 'Aves');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dui` varchar(10) NOT NULL,
  `nit` varchar(17) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codregistros`
--

CREATE TABLE `codregistros` (
  `idcr` int(11) NOT NULL,
  `codreg` varchar(20) NOT NULL,
  `nombre_registro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `codregistros`
--

INSERT INTO `codregistros` (`idcr`, `codreg`, `nombre_registro`) VALUES
(2, 'YKS36BW10', 'QUESO PROCESADO '),
(3, 'WN93745HW', 'CARNE MOLIDA DE POLLO'),
(4, 'AYI45ODBY', 'BISTEC PARRILLERO DE RES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inventario`
--

CREATE TABLE `detalle_inventario` (
  `iddi` int(11) NOT NULL,
  `idinventario` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `stock` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_inventario`
--

INSERT INTO `detalle_inventario` (`iddi`, `idinventario`, `idproducto`, `fecha_ingreso`, `idcategoria`, `stock`) VALUES
(0, 3, 4, '2021-11-23', 6, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_preventa`
--

CREATE TABLE `detalle_preventa` (
  `iddpv` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `cliente` varchar(50) DEFAULT NULL,
  `idproducto` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `precio_total` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_preventa`
--

INSERT INTO `detalle_preventa` (`iddpv`, `idcliente`, `idempleado`, `cliente`, `idproducto`, `precio`, `cantidad`, `descuento`, `precio_total`, `fecha`, `estado`) VALUES
(1, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2021-11-23 20:47:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dui` varchar(10) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `nit` varchar(17) DEFAULT NULL,
  `nrc` varchar(15) DEFAULT NULL,
  `logo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `idinventario` int(11) NOT NULL,
  `codproducto` varchar(20) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `stock` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`idinventario`, `codproducto`, `idcategoria`, `stock`) VALUES
(3, 'PR2903AL12', 6, 40),
(4, 'AYI45ODBY', 5, 19),
(5, 'WN93745HW', 9, 10),
(6, 'YKS36BW10', 7, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `codproducto` varchar(20) DEFAULT NULL,
  `producto` text NOT NULL,
  `descripcion` text NOT NULL,
  `precio_venta` float NOT NULL,
  `precio_compra` float NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `stock` float NOT NULL,
  `imagen` text NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `codproducto`, `producto`, `descripcion`, `precio_venta`, `precio_compra`, `idproveedor`, `fecha_ingreso`, `stock`, `imagen`, `estado`) VALUES
(1, 'AYI45ODBY', 'Bistec Parrillero de Res', 'BISTEC PARRILLERO DE RES LIBRA', 3.75, 2.5, 3, '2021-11-16 00:00:00', 19, 'AYI45ODBY.png', 1),
(2, 'WN93745HW', 'Carne Molida de Pollo', 'CARNE MOLIDA DE POLLO SELLO DE ORO LB', 2.32, 1.1, 7, '2021-11-19 00:00:00', 10, 'WN93745HW.png', 1),
(3, 'YKS36BW10', 'Queso Procesado', 'QUESO PROCESADO AMERICANO LA VILLITA 140 GRS', 1.26, 80, 5, '2021-11-19 00:00:00', 16, 'YKS36BW10.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL,
  `proveedor` varchar(50) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `proveedor`, `direccion`, `telefono`, `correo`) VALUES
(1, 'Mariscos El Pescador', 'mercadito de maeliot, portón #3', '45736932', 'mariscos@gmail.com'),
(3, 'Diaco,S.A. de C.V.', 'Km 4 1/4 carretera antigua a San Marcos, col. Las Delicias #250', '35921680', 'diaco@outlook.es'),
(4, 'Delimarket Embutidos La Española', 'Centro Comercial La Joya local 13, Santa Tecla, La Libertad SV, CP 1501', '22780451', 'embutidos@outlook.es'),
(5, 'Lacteos La Vaquita Oriental', '3 Avenida Norte, San Salvador', '24947218', 'lacteos@pedidosya.com'),
(6, 'Comercial Treviño', 'San Salvador, El Salvador', '12345672', 'ventas@comercialtrevino.com'),
(7, 'Cárnicas Urbano', 'San Salvador, El Salvador', '89537148', 'aves44@outlook.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `idtipo` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre_tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`idtipo`, `tipo`, `nombre_tipo`) VALUES
(1, 1, 'Root'),
(2, 2, 'Administrador'),
(3, 3, 'Operador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `token` varchar(10) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `passw`, `estado`, `tipo`, `token`, `correo`, `foto`) VALUES
(1, 'admin', '$2y$10$svYPxGihYJvF/adVQWQA2O/7eESY8Cm2FNyrT1doOTJCAwR.keNFm', 1, 1, '', 'gabrieladelm97@gmail.com', NULL),
(6, 'bart', '$2y$10$zQFCQvgTOduh0HyWVq1MTup7RCV0hNklTjMLpbTVrBompP/5Vlpfm', 1, 1, NULL, NULL, 'bart.png'),
(7, 'liseth', '$2y$10$0LjN9UlWiO2rXdPHYOtq8.wMPfQajvck3pOzL961cqatxZIORgz2e', 1, 1, NULL, 'gabrieladelm97@gmail.com', 'Gaby.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `codregistros`
--
ALTER TABLE `codregistros`
  ADD PRIMARY KEY (`idcr`);

--
-- Indices de la tabla `detalle_preventa`
--
ALTER TABLE `detalle_preventa`
  ADD PRIMARY KEY (`iddpv`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idempresa`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`idinventario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `codregistros`
--
ALTER TABLE `codregistros`
  MODIFY `idcr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_preventa`
--
ALTER TABLE `detalle_preventa`
  MODIFY `iddpv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idempresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `idinventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
