-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2021 a las 16:31:09
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_clinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `primer_ap` varchar(25) NOT NULL,
  `segundo_ap` varchar(25) NOT NULL,
  `telefono` int(10) NOT NULL,
  `tipo_usuario` varchar(25) NOT NULL,
  `contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cirugia`
--

CREATE TABLE `cirugia` (
  `id_cirugia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `cirujano` int(11) NOT NULL,
  `anestesiologo` int(11) NOT NULL,
  `enf_instrume` int(11) NOT NULL,
  `enf_circulan1` int(11) NOT NULL,
  `enf_circulan2` int(11) NOT NULL,
  `sala` int(4) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cirugia`
--

INSERT INTO `cirugia` (`id_cirugia`, `nombre`, `fecha`, `cirujano`, `anestesiologo`, `enf_instrume`, `enf_circulan1`, `enf_circulan2`, `sala`, `hora_inicio`, `hora_fin`) VALUES
(1, 'Traqueotomía', '2021-01-16', 1, 1, 1, 1, 1, 2, '15:00:00', '19:00:00'),
(2, 'Laparoscopía', '2021-01-15', 1, 1, 1, 1, 1, 1, '15:13:00', '17:00:00'),
(3, 'Corazon', '2021-01-18', 1, 3, 2, 1, 3, 2, '06:00:00', '13:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id_doctor` int(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `primer_ap` varchar(25) NOT NULL,
  `segundo_ap` varchar(25) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` int(4) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `cp` int(6) NOT NULL,
  `telefono` int(10) NOT NULL,
  `especialidad` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id_doctor`, `nombre`, `primer_ap`, `segundo_ap`, `calle`, `numero`, `colonia`, `ciudad`, `cp`, `telefono`, `especialidad`, `contraseña`) VALUES
(1, 'Octaviano', 'de la Torre', 'Enriquez', 'Avicultores', 87, 'Granjas', 'Jerez', 99340, 123456789, 'Cirujano', '12345'),
(2, 'Daniel', 'Valadez', 'Gurrola', 'Lirio', 54, 'Pedregal', 'Guadalupe', 99100, 1234589, 'Anestesiologo', '7894'),
(3, 'Joaquín Manuel', 'Pérez', 'Caldera', 'Delicias', 87, 'Durango', 'Durango', 778594, 456987123, 'Anestesiologo', '5698742');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermero`
--

CREATE TABLE `enfermero` (
  `id_enfermero` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `primer_ap` varchar(25) NOT NULL,
  `segundo_ap` varchar(25) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` int(4) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `cp` int(6) NOT NULL,
  `telefono` int(10) NOT NULL,
  `hora_entrada` datetime NOT NULL,
  `hora_salida` datetime NOT NULL,
  `contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `enfermero`
--

INSERT INTO `enfermero` (`id_enfermero`, `nombre`, `primer_ap`, `segundo_ap`, `calle`, `numero`, `colonia`, `ciudad`, `cp`, `telefono`, `hora_entrada`, `hora_salida`, `contraseña`) VALUES
(1, 'Liza', 'Santana', 'Contreras', 'Jalisco', 38, 'Sani', 'Jerez', 99340, 123456, '2021-01-16 15:07:05', '2021-01-16 17:00:00', '12345'),
(2, 'Lizbeth', 'Juarez', 'Marquez', 'Libertad', 58, 'Centro', 'Jerez', 99300, 123466987, '2021-01-18 06:00:00', '2021-01-18 14:00:00', 'prueba'),
(3, 'Pedro', 'Reveles', 'Moya', 'Laurel', 78, 'Botanica', 'Zacatecas', 789456, 123654889, '2021-01-18 08:00:00', '2021-01-18 17:00:00', 'prueba');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `cirugia`
--
ALTER TABLE `cirugia`
  ADD PRIMARY KEY (`id_cirugia`),
  ADD KEY `cirujano` (`cirujano`),
  ADD KEY `anestesiologo` (`anestesiologo`),
  ADD KEY `enf_instrume` (`enf_instrume`),
  ADD KEY `enf_circulan1` (`enf_circulan1`),
  ADD KEY `enf_circulan2` (`enf_circulan2`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id_doctor`);

--
-- Indices de la tabla `enfermero`
--
ALTER TABLE `enfermero`
  ADD PRIMARY KEY (`id_enfermero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cirugia`
--
ALTER TABLE `cirugia`
  MODIFY `id_cirugia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id_doctor` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `enfermero`
--
ALTER TABLE `enfermero`
  MODIFY `id_enfermero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cirugia`
--
ALTER TABLE `cirugia`
  ADD CONSTRAINT `cirugia_ibfk_1` FOREIGN KEY (`cirujano`) REFERENCES `doctores` (`id_doctor`),
  ADD CONSTRAINT `cirugia_ibfk_2` FOREIGN KEY (`anestesiologo`) REFERENCES `doctores` (`id_doctor`),
  ADD CONSTRAINT `cirugia_ibfk_3` FOREIGN KEY (`enf_instrume`) REFERENCES `enfermero` (`id_enfermero`),
  ADD CONSTRAINT `cirugia_ibfk_4` FOREIGN KEY (`enf_circulan1`) REFERENCES `enfermero` (`id_enfermero`),
  ADD CONSTRAINT `cirugia_ibfk_5` FOREIGN KEY (`enf_circulan2`) REFERENCES `enfermero` (`id_enfermero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
