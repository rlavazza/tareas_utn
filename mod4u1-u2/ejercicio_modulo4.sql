-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-05-2023 a las 21:35:03
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicio_modulo4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `trabajo` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `salario` int NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `trabajo`, `edad`, `salario`, `mail`) VALUES
(1, 'Alfred ', 'Fernandez ', ' Programador  ', 31, 75000, 'af@bignet.com'),
(2, 'Juan', ' Agüero ', 'Programador 36 85000 juan@bignet.com', 36, 85000, ' juan@bignet.com'),
(3, 'Jimena', 'Cazado ', 'Diseñador Web ', 32, 110000, ' jimena@bignet.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
