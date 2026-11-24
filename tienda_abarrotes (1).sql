-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2026 a las 17:42:34
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
-- Base de datos: `tienda_abarrotes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `numero_documento` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_clientes`
--

INSERT INTO `tb_clientes` (`id_cliente`, `nombre`, `numero_documento`, `telefono`, `direccion`, `correo`, `estado`) VALUES
(1, 'Juan Pérez', '1001234567', '3001234567', 'Calle 12 #45-67', 'juan@gmail.com', 'Activo'),
(2, 'María Gómez', '1002345678', '3102345678', 'Carrera 8 #23-45', 'maria@gmail.com', 'Activo'),
(3, 'Carlos Ruiz', '1003456789', '3203456789', 'Calle 5 #10-20', 'carlos@hotmail.com', 'Activo'),
(4, 'Ana Martínez', '1004567890', '3004567890', 'Carrera 15 #30-15', 'ana@gmail.com', 'Activo'),
(5, 'Luis Rodríguez', '1005678901', '3155678901', 'Calle 20 #5-10', 'luis@yahoo.com', 'Inactivo'),
(6, 'Sofía Castro', '1006789012', '3116789012', 'Diagonal 3 #8-22', 'sofia@gmail.com', 'Activo'),
(7, 'Pedro Ramírez', '1007890123', '3047890123', 'Calle 88 #22-33', 'pedro@outlook.com', 'Activo'),
(8, 'Lucía Hernández', '1008901234', '3178901234', 'Carrera 3 #44-55', 'lucia@gmail.com', 'Inactivo'),
(9, 'Jorge Vargas', '1009012345', '3059012345', 'Calle 30 #12-14', 'jorge@gmail.com', 'Activo'),
(10, 'Camila López', '1000123456', '3190123456', 'Carrera 22 #77-88', 'camila@mail.com', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_venta`
--

CREATE TABLE `tb_detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `observacion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_detalle_venta`
--

INSERT INTO `tb_detalle_venta` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`, `observacion`) VALUES
(1, 1, 1, 5, 4500.00, 22500.00, 'Sin observación'),
(2, 1, 3, 2, 5800.00, 11600.00, 'Cliente pidió extra'),
(3, 1, 7, 1, 3800.00, 3800.00, ''),
(4, 2, 2, 3, 3200.00, 9600.00, ''),
(5, 2, 8, 2, 2900.00, 5800.00, 'Entrega inmediata'),
(6, 3, 4, 4, 18000.00, 72000.00, 'Para eventos'),
(7, 3, 5, 2, 8500.00, 17000.00, ''),
(8, 4, 10, 10, 1800.00, 18000.00, 'Compra mayorista'),
(9, 4, 9, 2, 2500.00, 5000.00, ''),
(10, 5, 2, 4, 3200.00, 12800.00, 'Cliente frecuente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_productos`
--

CREATE TABLE `tb_productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_productos`
--

INSERT INTO `tb_productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `categoria`, `estado`) VALUES
(1, 'Arroz 1kg', 'Arroz blanco grano largo', 4500.00, 50, 'Granos', 'Disponible'),
(2, 'Leche líquida', 'Leche entera bolsa 1L', 3200.00, 80, 'Lácteos', 'Disponible'),
(3, 'Pan de molde', 'Pan tajado bolsa 450g', 5800.00, 25, 'Panadería', 'Disponible'),
(4, 'Huevos cartón 30', 'Huevos frescos cartón', 18000.00, 15, 'Huevos', 'Disponible'),
(5, 'Aceite vegetal', 'Aceite de cocina 1000ml', 8500.00, 30, 'Aceites', 'Disponible'),
(6, 'Café molido', 'Café especial 500g', 12000.00, 0, 'Bebidas', 'Agotado'),
(7, 'Azúcar blanca', 'Azúcar refinada 1kg', 3800.00, 45, 'Endulzantes', 'Disponible'),
(8, 'Pasta espagueti', 'Pasta italiana 500g', 2900.00, 60, 'Pastas', 'Disponible'),
(9, 'Jabón en barra', 'Jabón para lavar ropa', 2500.00, 100, 'Limpieza', 'Disponible'),
(10, 'Sal de mesa', 'Sal fina yodada 500g', 1800.00, 75, 'Condimentos', 'Disponible'),
(11, 'Arroz 1kg', 'Arroz blanco grano largo', 4500.00, 50, 'Granos', 'Disponible'),
(12, 'Leche líquida', 'Leche entera bolsa 1L', 3200.00, 80, 'Lácteos', 'Disponible'),
(13, 'Pan de molde', 'Pan tajado bolsa 450g', 5800.00, 25, 'Panadería', 'Disponible'),
(14, 'Huevos cartón 30', 'Huevos frescos cartón', 18000.00, 15, 'Huevos', 'Disponible'),
(15, 'Aceite vegetal', 'Aceite de cocina 1000ml', 8500.00, 30, 'Aceites', 'Disponible'),
(16, 'Café molido', 'Café especial 500g', 12000.00, 0, 'Bebidas', 'Agotado'),
(17, 'Azúcar blanca', 'Azúcar refinada 1kg', 3800.00, 45, 'Endulzantes', 'Disponible'),
(18, 'Pasta espagueti', 'Pasta italiana 500g', 2900.00, 60, 'Pastas', 'Disponible'),
(19, 'Jabón en barra', 'Jabón para lavar ropa', 2500.00, 100, 'Limpieza', 'Disponible'),
(20, 'Sal de mesa', 'Sal fina yodada 500g', 1800.00, 75, 'Condimentos', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ventas`
--

CREATE TABLE `tb_ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(30) NOT NULL,
  `vendedor` varchar(80) DEFAULT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_ventas`
--

INSERT INTO `tb_ventas` (`id_venta`, `id_cliente`, `fecha_venta`, `total`, `metodo_pago`, `vendedor`, `estado`) VALUES
(1, 1, '2026-11-01', 38500.00, 'Efectivo', 'Carlos Pérez', 'Pagada'),
(2, 2, '2026-11-02', 15200.00, 'Tarjeta', 'Carlos Pérez', 'Pagada'),
(3, 3, '2026-11-03', 89000.00, 'Efectivo', 'Ana Ruiz', 'Pagada'),
(4, 4, '2026-11-04', 22500.00, 'Transferencia', 'Carlos Pérez', 'Pagada'),
(5, 1, '2026-11-05', 12800.00, 'Efectivo', 'Ana Ruiz', 'Pagada'),
(6, 5, '2026-11-06', 45000.00, 'Efectivo', 'Carlos Pérez', 'Pendiente'),
(7, 6, '2026-11-07', 31000.00, 'Tarjeta', 'Ana Ruiz', 'Pagada'),
(8, 7, '2026-11-08', 76500.00, 'Efectivo', 'Carlos Pérez', 'Pagada'),
(9, 8, '2026-11-09', 9800.00, 'Efectivo', 'Ana Ruiz', 'Anulada'),
(10, 9, '2026-11-10', 52000.00, 'Transferencia', 'Carlos Pérez', 'Pagada'),
(11, 1, '2026-11-01', 38500.00, 'Efectivo', 'Carlos Pérez', 'Pagada'),
(12, 2, '2026-11-02', 15200.00, 'Tarjeta', 'Carlos Pérez', 'Pagada'),
(13, 3, '2026-11-03', 89000.00, 'Efectivo', 'Ana Ruiz', 'Pagada'),
(14, 4, '2026-11-04', 22500.00, 'Transferencia', 'Carlos Pérez', 'Pagada'),
(15, 1, '2026-11-05', 12800.00, 'Efectivo', 'Ana Ruiz', 'Pagada'),
(16, 5, '2026-11-06', 45000.00, 'Efectivo', 'Carlos Pérez', 'Pendiente'),
(17, 6, '2026-11-07', 31000.00, 'Tarjeta', 'Ana Ruiz', 'Pagada'),
(18, 7, '2026-11-08', 76500.00, 'Efectivo', 'Carlos Pérez', 'Pagada'),
(19, 8, '2026-11-09', 9800.00, 'Efectivo', 'Ana Ruiz', 'Anulada'),
(20, 9, '2026-11-10', 52000.00, 'Transferencia', 'Carlos Pérez', 'Pagada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `tb_detalle_venta`
--
ALTER TABLE `tb_detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `tb_productos`
--
ALTER TABLE `tb_productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `tb_ventas`
--
ALTER TABLE `tb_ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_detalle_venta`
--
ALTER TABLE `tb_detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_productos`
--
ALTER TABLE `tb_productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tb_ventas`
--
ALTER TABLE `tb_ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_detalle_venta`
--
ALTER TABLE `tb_detalle_venta`
  ADD CONSTRAINT `tb_detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `tb_ventas` (`id_venta`),
  ADD CONSTRAINT `tb_detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tb_productos` (`id_producto`);

--
-- Filtros para la tabla `tb_ventas`
--
ALTER TABLE `tb_ventas`
  ADD CONSTRAINT `tb_ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
