-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-06-2023 a las 06:14:04
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
-- Base de datos: `aventura-extrema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

DROP TABLE IF EXISTS `novedades`;
CREATE TABLE IF NOT EXISTS `novedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `cuerpo` text NOT NULL,
  `precio` decimal(10,0) UNSIGNED NOT NULL,
  `img_id` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id`, `titulo`, `cuerpo`, `precio`, `img_id`) VALUES
(5, 'Rafting por 2 días + campamento nocturno', 'Salida al atardecer hacia Cerro Negro, bajada de rafting hasta Estación Guido. Armado de carpas, asado y drinks.\r\nAL día siguiente, desayuno y bajada de rafting hasta nuestra base.', '22000', 'xcyervncwk6joxg9gdfu'),
(6, 'Canopy + Almuerzo + Rafting', 'Se realiza un pequeño trekking hasta el primer cable. Son 6 cables en total con el cruce del río. Regreso a la base para almorzar en restaurante. A la tarde bajada de rafting de  12 km.  \r\nIncluye: Guías, equipos, traje de neoprene, casco, botas para agua y chaleco. \r\nPara el Canopy se requieren zapatillas.', '18000', 'nlvedpvlr541prhcmjfq'),
(17, 'Escalada en roca  + kayak de lago', 'Trekking hasta el sitio de escalada,  pequeño entrenamiento con el guía y escalada.  Almuerzo en la base o picnic. Traslado al dique Poterillos en camioneta y recorrido en kayak por el lago.\r\nIncluye guías, equipos de escalada , enterito de neoprene y chaleco salvavidas', '150000', 'h6mpearuxhnqqpihjsg0'),
(21, 'Parapente + Canopy + Almuerzo', 'Salida en la mañana hacia Cerro Arco. Parapente por 30 minutos. Traslado a Potrerillos. Almuerzo en el restaurante, Canopy durante la tarde.\r\nIncluye: Equipos, traslados, almuerzo.\r\n', '30000', 'gwtklt5uvtr2gfhk1fnv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'roxana', '81dc9bdb52d04dc20036dbd8313ed055'),
(3, 'Lorenzo', '689ae5e1772753491a9dcbcf10bb807a');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
