-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: abcc-articulos
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `sku` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador del articulo',
  `nombre` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nombre del articulo',
  `marca` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Marca del articulo',
  `modelo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Modelo del articulo',
  `id_departamento` int NOT NULL COMMENT 'Departamento al que pertenece el articulo',
  `id_clase` int NOT NULL COMMENT 'Clase de articulo',
  `id_familia` int NOT NULL COMMENT 'Familia a la que pertenece el articulo',
  `fecha_alta` date NOT NULL DEFAULT '1900-01-01' COMMENT 'Fecha en la que se da de alta el articulo',
  `stock` int unsigned NOT NULL COMMENT 'Cantidad en stock',
  `cantidad` int unsigned NOT NULL DEFAULT '0' COMMENT 'Cantidad en tienda o departamendo',
  `descontinuado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicador de articulo descontinuado',
  `fecha_baja` date DEFAULT '1900-01-01' COMMENT 'Fecha de baja de articulo',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Inidicador de articulo activo',
  PRIMARY KEY (`sku`),
  KEY `articulos_departamentos_FK` (`id_departamento`),
  KEY `articulos_clases_FK` (`id_clase`),
  KEY `articulos_familias_FK` (`id_familia`),
  CONSTRAINT `articulos_clases_FK` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `articulos_departamentos_FK` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `articulos_familias_FK` FOREIGN KEY (`id_familia`) REFERENCES `familias` (`id_familia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (2,'Pantalla plasma','JVC','42 pulgadas',1,1,2251,'2024-07-28',50,20,0,'1900-01-01',1),(3,'Television','JVC','24 pulgadas',1,1,2251,'2024-07-28',50,25,0,'1900-01-01',1),(4,'Television','JVC','55 pulgadas',1,1,2251,'2024-07-28',50,25,0,'1900-01-01',1),(5,'Television','LG','55 pulgadas',1,1,2254,'2024-07-29',50,20,0,'1900-01-01',1),(6,'Television','samsung','75 pulgadas',1,1,2255,'2024-07-29',50,25,0,'1900-01-01',1),(7,'Balon','Nike','c23',7,66,2576,'2024-07-29',55,40,0,'1900-01-01',1),(8,'Balon','Voit','c23',7,66,2576,'2024-07-29',55,40,0,'1900-01-01',1);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clases` (
  `id_clase` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la clase',
  `nombre_clase` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'nombre de la clase',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indicador de activo de la clase',
  `id_departamento` int NOT NULL COMMENT 'Refrencia al departamento que pertenece la clase',
  `nombre_familia` varchar(30) NOT NULL,
  PRIMARY KEY (`id_clase`),
  KEY `clases_departamentos_FK` (`id_departamento`),
  CONSTRAINT `clases_departamentos_FK` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se almacenaran las clases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` VALUES (1,'Televisores',1,1,''),(2,'Celulares',1,1,''),(3,'Laptops',1,1,''),(4,'Tablets',1,1,''),(5,'Cámaras',1,1,''),(6,'Videojuegos',1,1,''),(7,'Bocinas',1,1,''),(8,'Audífonos',1,1,''),(9,'Smartwatches',1,1,''),(10,'Drones',1,1,''),(11,'Sofás',1,2,''),(12,'Camas',1,2,''),(13,'Mesas',1,2,''),(14,'Sillas',1,2,''),(15,'Escritorios',1,2,''),(16,'Estanterías',1,2,''),(17,'Armarios',1,2,''),(18,'Muebles de TV',1,2,''),(19,'Cunas',1,2,''),(20,'Tocadores',1,2,''),(21,'Camisas',1,3,''),(22,'Pantalones',1,3,''),(23,'Trajes',1,3,''),(24,'Chaquetas',1,3,''),(25,'Playeras',1,3,''),(26,'Sudaderas',1,3,''),(27,'Ropa interior',1,3,''),(28,'Pijamas',1,3,''),(29,'Abrigos',1,3,''),(30,'Calcetines',1,3,''),(31,'Vestidos',1,4,''),(32,'Blusas',1,4,''),(33,'Faldas',1,4,''),(34,'Pantalones',1,4,''),(35,'Trajes de oficina',1,4,''),(36,'Chaquetas',1,4,''),(37,'Playeras',1,4,''),(38,'Sudaderas',1,4,''),(39,'Ropa interior',1,4,''),(40,'Abrigos',1,4,''),(41,'Juguetes para bebés',1,5,''),(42,'Juguetes educativos',1,5,''),(43,'Ropa de bebé',1,5,''),(44,'Ropa de niño',1,5,''),(45,'Ropa de niña',1,5,''),(46,'Zapatos para niños',1,5,''),(47,'Accesorios para niños',1,5,''),(48,'Ropa deportiva para niños',1,5,''),(49,'Juguetes de construcción',1,5,''),(50,'Juguetes de figuras de acción',1,5,''),(51,'Zapatos formales',1,6,''),(52,'Zapatos casuales',1,6,''),(53,'Tenis',1,6,''),(54,'Botas',1,6,''),(55,'Sandalias',1,6,''),(56,'Zapatos deportivos',1,6,''),(57,'Zapatos de trabajo',1,6,''),(58,'Zapatos de fiesta',1,6,''),(59,'Zapatos de verano',1,6,''),(60,'Zapatos de invierno',1,6,''),(61,'Ropa deportiva',1,7,''),(62,'Calzado deportivo',1,7,''),(63,'Equipos de gimnasio',1,7,''),(64,'Accesorios deportivos',1,7,''),(65,'Bicicletas',1,7,''),(66,'Balones',1,7,''),(67,'Raquetas',1,7,''),(68,'Gorras',1,7,''),(69,'Sudaderas deportivas',1,7,''),(70,'Pantalones deportivos',1,7,''),(71,'Juguetes para bebés',1,8,''),(72,'Juguetes educativos',1,8,''),(73,'Muñecas',1,8,''),(74,'Figuras de acción',1,8,''),(75,'Juguetes de construcción',1,8,''),(76,'Juguetes electrónicos',1,8,''),(77,'Peluches',1,8,''),(78,'Juegos de mesa',1,8,''),(79,'Vehículos de juguete',1,8,''),(80,'Puzzles',1,8,''),(81,'Refrigeradores',1,9,''),(82,'Lavadoras',1,9,''),(83,'Estufas',1,9,''),(84,'Microondas',1,9,''),(85,'Licuadoras',1,9,''),(86,'Aspiradoras',1,9,''),(87,'Plancha',1,9,''),(88,'Hornos',1,9,''),(89,'Cafeteras',1,9,''),(90,'Ventiladores',1,9,'');
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamento` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de departamento',
  `nombre_departamento` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nombre de el departamento',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indicador de activo del departamento',
  `id_clase` int NOT NULL,
  `nombre_clase` varchar(30) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se almacenaran los departamentos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Electrónica',1,0,''),(2,'Muebles',1,0,''),(3,'Ropa de Hombre',1,0,''),(4,'Ropa de Mujer',1,0,''),(5,'Juguetes',1,0,''),(6,'Calzado',1,0,''),(7,'Deportes',1,0,''),(8,'Hogar',1,0,''),(9,'Línea Blanca',1,0,'');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familias`
--

DROP TABLE IF EXISTS `familias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familias` (
  `id_familia` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la familia',
  `nombre_familia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nombre de la familia',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indicador de activo de la familia',
  `id_clase` int NOT NULL COMMENT 'Referencia a la clase donde pertenece la familia',
  PRIMARY KEY (`id_familia`),
  KEY `familias_clases_FK` (`id_clase`),
  CONSTRAINT `familias_clases_FK` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se almacenaran las familias de articulos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familias`
--

LOCK TABLES `familias` WRITE;
/*!40000 ALTER TABLE `familias` DISABLE KEYS */;
INSERT INTO `familias` VALUES (2251,'Televisores LED',1,1),(2252,'Televisores OLED',1,1),(2253,'Televisores 4K',1,1),(2254,'Televisores Smart',1,1),(2255,'Televisores HD',1,1),(2256,'Celulares Android',1,2),(2257,'Celulares iOS',1,2),(2258,'Celulares con Cámara Dual',1,2),(2259,'Celulares con Pantalla Grande',1,2),(2260,'Celulares con 5G',1,2),(2261,'Laptops para Gaming',1,3),(2262,'Laptops Ultraligeras',1,3),(2263,'Laptops para Diseño Gráfico',1,3),(2264,'Laptops para Trabajo',1,3),(2265,'Laptops 2 en 1',1,3),(2266,'Tablets Android',1,4),(2267,'Tablets iOS',1,4),(2268,'Tablets con Stylus',1,4),(2269,'Tablets para Niños',1,4),(2270,'Tablets para Dibujo',1,4),(2271,'Cámaras DSLR',1,5),(2272,'Cámaras Sin Espejo',1,5),(2273,'Cámaras Compactas',1,5),(2274,'Cámaras Deportivas',1,5),(2275,'Cámaras de Acción',1,5),(2276,'Videojuegos de Acción',1,6),(2277,'Videojuegos de Aventura',1,6),(2278,'Videojuegos de Rol',1,6),(2279,'Videojuegos de Deportes',1,6),(2280,'Videojuegos de Estrategia',1,6),(2281,'Bocinas Bluetooth',1,7),(2282,'Bocinas Inteligentes',1,7),(2283,'Bocinas para PC',1,7),(2284,'Bocinas Portátiles',1,7),(2285,'Bocinas de Alta Fidelidad',1,7),(2286,'Audífonos Inalámbricos',1,8),(2287,'Audífonos con Cancelación de Ruido',1,8),(2288,'Audífonos Deportivos',1,8),(2289,'Audífonos Sobre la Oreja',1,8),(2290,'Audífonos In-Ear',1,8),(2291,'Smartwatches Android',1,9),(2292,'Smartwatches iOS',1,9),(2293,'Smartwatches Deportivos',1,9),(2294,'Smartwatches de Lujo',1,9),(2295,'Smartwatches para Salud',1,9),(2296,'Drones Recreativos',1,10),(2297,'Drones Profesionales',1,10),(2298,'Drones para Fotografía',1,10),(2299,'Drones de Carrera',1,10),(2300,'Drones para Agricultura',1,10),(2301,'Sofás de Cuero',1,11),(2302,'Sofás de Tela',1,11),(2303,'Sofás Recliner',1,11),(2304,'Sofás Seccionales',1,11),(2305,'Sofás Cama',1,11),(2306,'Camas King Size',1,12),(2307,'Camas Queen Size',1,12),(2308,'Camas Individuales',1,12),(2309,'Camas con Almacenamiento',1,12),(2310,'Camas de Madera',1,12),(2311,'Mesas de Comedor',1,13),(2312,'Mesas de Centro',1,13),(2313,'Mesas Auxiliares',1,13),(2314,'Mesas de Oficina',1,13),(2315,'Mesas de Noche',1,13),(2316,'Sillas de Oficina',1,14),(2317,'Sillas de Comedor',1,14),(2318,'Sillas de Exterior',1,14),(2319,'Sillas Ergonómicas',1,14),(2320,'Sillas Reclinables',1,14),(2321,'Escritorios de Oficina',1,15),(2322,'Escritorios para Estudio',1,15),(2323,'Escritorios Esquinero',1,15),(2324,'Escritorios con Almacenamiento',1,15),(2325,'Escritorios Ajustables',1,15),(2326,'Estanterías de Madera',1,16),(2327,'Estanterías Metálicas',1,16),(2328,'Estanterías Modulares',1,16),(2329,'Estanterías de Pared',1,16),(2330,'Estanterías para Libros',1,16),(2331,'Armarios de Madera',1,17),(2332,'Armarios Empotrados',1,17),(2333,'Armarios con Puertas Corredizas',1,17),(2334,'Armarios para Ropa',1,17),(2335,'Armarios de Oficina',1,17),(2336,'Muebles de TV de Madera',1,18),(2337,'Muebles de TV Modernos',1,18),(2338,'Muebles de TV con Almacenamiento',1,18),(2339,'Muebles de TV Minimalistas',1,18),(2340,'Muebles de TV con Soporte de Pared',1,18),(2341,'Cunas de Madera',1,19),(2342,'Cunas Convertibles',1,19),(2343,'Cunas Portátiles',1,19),(2344,'Cunas con Móvil',1,19),(2345,'Cunas con Almacenamiento',1,19),(2346,'Tocadores con Espejo',1,20),(2347,'Tocadores con Sillas',1,20),(2348,'Tocadores de Madera',1,20),(2349,'Tocadores Modernos',1,20),(2350,'Tocadores con Almacenamiento',1,20),(2351,'Camisas de Manga Corta',1,21),(2352,'Camisas de Manga Larga',1,21),(2353,'Camisas Casual',1,21),(2354,'Camisas Formales',1,21),(2355,'Camisas de Algodón',1,21),(2356,'Pantalones Vaqueros',1,22),(2357,'Pantalones Formales',1,22),(2358,'Pantalones Deportivos',1,22),(2359,'Pantalones Chinos',1,22),(2360,'Pantalones Cortos',1,22),(2361,'Trajes de Dos Piezas',1,23),(2362,'Trajes de Tres Piezas',1,23),(2363,'Trajes Casual',1,23),(2364,'Trajes de Oficina',1,23),(2365,'Trajes de Boda',1,23),(2366,'Chaquetas de Cuero',1,24),(2367,'Chaquetas de Invierno',1,24),(2368,'Chaquetas Casual',1,24),(2369,'Chaquetas Deportivas',1,24),(2370,'Chaquetas de Plumas',1,24),(2371,'Playeras Básicas',1,25),(2372,'Playeras Gráficas',1,25),(2373,'Playeras de Manga Corta',1,25),(2374,'Playeras de Manga Larga',1,25),(2375,'Playeras Deportivas',1,25),(2376,'Sudaderas con Capucha',1,26),(2377,'Sudaderas sin Capucha',1,26),(2378,'Sudaderas Deportivas',1,26),(2379,'Sudaderas de Algodón',1,26),(2380,'Sudaderas con Cremallera',1,26),(2381,'Boxers',1,27),(2382,'Calzoncillos',1,27),(2383,'Sostenes',1,27),(2384,'Braguitas',1,27),(2385,'Ropa Interior Termal',1,27),(2386,'Pijamas de Algodón',1,28),(2387,'Pijamas de Satén',1,28),(2388,'Pijamas de Lana',1,28),(2389,'Pijamas con Estampados',1,28),(2390,'Pijamas de Dos Piezas',1,28),(2391,'Abrigos de Lana',1,29),(2392,'Abrigos de Plumas',1,29),(2393,'Abrigos Trench',1,29),(2394,'Abrigos de Cuero',1,29),(2395,'Abrigos Cortos',1,29),(2396,'Calcetines de Algodón',1,30),(2397,'Calcetines de Lana',1,30),(2398,'Calcetines Deportivos',1,30),(2399,'Calcetines Cortos',1,30),(2400,'Calcetines Largos',1,30),(2401,'Vestidos de Cóctel',1,31),(2402,'Vestidos de Fiesta',1,31),(2403,'Vestidos de Noche',1,31),(2404,'Vestidos Casual',1,31),(2405,'Vestidos de Verano',1,31),(2406,'Blusas de Manga Corta',1,32),(2407,'Blusas de Manga Larga',1,32),(2408,'Blusas Casual',1,32),(2409,'Blusas Formales',1,32),(2410,'Blusas de Seda',1,32),(2411,'Faldas Cortas',1,33),(2412,'Faldas Largas',1,33),(2413,'Faldas de Cintura Alta',1,33),(2414,'Faldas de Cintura Baja',1,33),(2415,'Faldas Plisadas',1,33),(2416,'Pantalones Vaqueros',1,34),(2417,'Pantalones Formales',1,34),(2418,'Pantalones Cortos',1,34),(2419,'Pantalones Chinos',1,34),(2420,'Pantalones de Trabajo',1,34),(2421,'Trajes de Dos Piezas',1,35),(2422,'Trajes de Tres Piezas',1,35),(2423,'Trajes Slim Fit',1,35),(2424,'Trajes Clásicos',1,35),(2425,'Trajes a Medida',1,35),(2426,'Chaquetas de Invierno',1,36),(2427,'Chaquetas de Cuero',1,36),(2428,'Chaquetas de Denim',1,36),(2429,'Chaquetas de Lana',1,36),(2430,'Chaquetas de Plumas',1,36),(2431,'Playeras Básicas',1,37),(2432,'Playeras con Estampado',1,37),(2433,'Playeras de Manga Corta',1,37),(2434,'Playeras de Manga Larga',1,37),(2435,'Playeras de Viscosa',1,37),(2436,'Sudaderas con Capucha',1,38),(2437,'Sudaderas sin Capucha',1,38),(2438,'Sudaderas Deportivas',1,38),(2439,'Sudaderas de Algodón',1,38),(2440,'Sudaderas de Lana',1,38),(2441,'Boxers',1,39),(2442,'Calzoncillos',1,39),(2443,'Sostenes',1,39),(2444,'Braguitas',1,39),(2445,'Ropa Interior Termal',1,39),(2446,'Abrigos de Lana',1,40),(2447,'Abrigos de Plumas',1,40),(2448,'Abrigos Trench',1,40),(2449,'Abrigos de Cuero',1,40),(2450,'Abrigos Cortos',1,40),(2451,'Juguetes de Peluche',1,41),(2452,'Sonajeros',1,41),(2453,'Móviles de Cuna',1,41),(2454,'Juguetes de Tela',1,41),(2455,'Juguetes para el Baño',1,41),(2456,'Bloques de Construcción',1,42),(2457,'Juguetes Musicales',1,42),(2458,'Juguetes Didácticos',1,42),(2459,'Puzzles',1,42),(2460,'Juguetes de Aprendizaje',1,42),(2461,'Bodies',1,43),(2462,'Pijamas',1,43),(2463,'Overoles',1,43),(2464,'Gorros',1,43),(2465,'Mitones',1,43),(2466,'Camisas',1,44),(2467,'Pantalones',1,44),(2468,'Chaquetas',1,44),(2469,'Sudaderas',1,44),(2470,'Abrigos',1,44),(2471,'Vestidos',1,45),(2472,'Faldas',1,45),(2473,'Blusas',1,45),(2474,'Chaquetas',1,45),(2475,'Abrigos',1,45),(2476,'Zapatos Casual',1,46),(2477,'Zapatos Deportivos',1,46),(2478,'Botas',1,46),(2479,'Sandalias',1,46),(2480,'Zapatos de Fiesta',1,46),(2481,'Gorras',1,47),(2482,'Bufandas',1,47),(2483,'Guantes',1,47),(2484,'Sombreros',1,47),(2485,'Cinturones',1,47),(2486,'Camisetas Deportivas',1,48),(2487,'Shorts Deportivos',1,48),(2488,'Sudaderas Deportivas',1,48),(2489,'Ropa de Correr',1,48),(2490,'Ropa de Entrenamiento',1,48),(2491,'Ladrillos de Construcción',1,49),(2492,'Set de Construcción',1,49),(2493,'Juguetes de Ensamblaje',1,49),(2494,'Bloques de Construcción',1,49),(2495,'Construcciones Magnéticas',1,49),(2496,'Figuras de Superhéroes',1,50),(2497,'Figuras de Animales',1,50),(2498,'Figuras de Robots',1,50),(2499,'Figuras de Personajes de Películas',1,50),(2500,'Figuras de Acción de Deportes',1,50),(2501,'Zapatos de Charol',1,51),(2502,'Mocasines',1,51),(2503,'Oxfords',1,51),(2504,'Loafers',1,51),(2505,'Derbies',1,51),(2506,'Zapatos de Cuero Casual',1,52),(2507,'Mocasines Casual',1,52),(2508,'Zapatos de Tela',1,52),(2509,'Zapatos de Lona',1,52),(2510,'Zapatos de Gamuzado',1,52),(2511,'Tenis de Running',1,53),(2512,'Tenis de Entrenamiento',1,53),(2513,'Tenis de Basketball',1,53),(2514,'Tenis de Skate',1,53),(2515,'Tenis Casual',1,53),(2516,'Botas de Trabajo',1,54),(2517,'Botas de Montaña',1,54),(2518,'Botas de Cuero',1,54),(2519,'Botas Impermeables',1,54),(2520,'Botas de Campo',1,54),(2521,'Sandalias de Playa',1,55),(2522,'Sandalias de Cuero',1,55),(2523,'Sandalias de Tela',1,55),(2524,'Sandalias con Plataforma',1,55),(2525,'Sandalias Deportivas',1,55),(2526,'Zapatos de Running',1,56),(2527,'Zapatos de Entrenamiento',1,56),(2528,'Zapatos de Basketball',1,56),(2529,'Zapatos de Fútbol',1,56),(2530,'Zapatos de Tenis',1,56),(2531,'Zapatos de Seguridad',1,57),(2532,'Botas de Trabajo',1,57),(2533,'Zapatos Antideslizantes',1,57),(2534,'Zapatos con Punta de Acero',1,57),(2535,'Zapatos de Protección',1,57),(2536,'Zapatos de Charol',1,58),(2537,'Zapatos de Tacón',1,58),(2538,'Zapatos con Brillos',1,58),(2539,'Zapatos de Cuero Brillante',1,58),(2540,'Zapatos de Diseño Exclusivo',1,58),(2541,'Sandalias',1,59),(2542,'Espadrilles',1,59),(2543,'Zapatos de Tela',1,59),(2544,'Zapatos de Lona',1,59),(2545,'Zapatos Abiertos',1,59),(2546,'Botas de Invierno',1,60),(2547,'Zapatos Forrados',1,60),(2548,'Botines de Cuero',1,60),(2549,'Zapatos con Aislante',1,60),(2550,'Botas Impermeables',1,60),(2551,'Camisetas Deportivas',1,61),(2552,'Pantalones Deportivos',1,61),(2553,'Shorts Deportivos',1,61),(2554,'Chaquetas Deportivas',1,61),(2555,'Sudaderas Deportivas',1,61),(2556,'Zapatillas de Running',1,62),(2557,'Zapatillas de Entrenamiento',1,62),(2558,'Zapatillas de Basketball',1,62),(2559,'Zapatillas de Fútbol',1,62),(2560,'Zapatillas de Tenis',1,62),(2561,'Pesas',1,63),(2562,'Bancos de Ejercicio',1,63),(2563,'Máquinas de Cardio',1,63),(2564,'Mancuernas',1,63),(2565,'Cintas de Correr',1,63),(2566,'Guantes de Entrenamiento',1,64),(2567,'Cinturones de Pesas',1,64),(2568,'Muñequeras',1,64),(2569,'Tobilleras',1,64),(2570,'Botellas de Agua',1,64),(2571,'Bicicletas de Ruta',1,65),(2572,'Bicicletas de Montaña',1,65),(2573,'Bicicletas Urbanas',1,65),(2574,'Bicicletas Eléctricas',1,65),(2575,'Bicicletas Plegables',1,65),(2576,'Balones de Fútbol',1,66),(2577,'Balones de Basketball',1,66),(2578,'Balones de Rugby',1,66),(2579,'Balones de Volibol',1,66),(2580,'Balones de Tenis',1,66),(2581,'Raquetas de Tenis',1,67),(2582,'Raquetas de Badminton',1,67),(2583,'Raquetas de Squash',1,67),(2584,'Raquetas de Ping Pong',1,67),(2585,'Raquetas de Pádel',1,67),(2586,'Gorras de Béisbol',1,68),(2587,'Gorras de Deportes',1,68),(2588,'Gorras de Sol',1,68),(2589,'Gorras de Moda',1,68),(2590,'Gorras de Malla',1,68),(2591,'Sudaderas con Capucha',1,69),(2592,'Sudaderas sin Capucha',1,69),(2593,'Sudaderas de Compresión',1,69),(2594,'Sudaderas de Entrenamiento',1,69),(2595,'Sudaderas de Running',1,69),(2596,'Pantalones de Jogging',1,70),(2597,'Pantalones de Compresión',1,70),(2598,'Pantalones de Running',1,70),(2599,'Pantalones de Entrenamiento',1,70),(2600,'Pantalones Cortos Deportivos',1,70),(2601,'Sonajeros',1,71),(2602,'Mordedores',1,71),(2603,'Juguetes de Tela',1,71),(2604,'Juguetes de Madera',1,71),(2605,'Juguetes de Plástico',1,71),(2606,'Juguetes de Aprendizaje Temprano',1,72),(2607,'Juguetes de Matemáticas',1,72),(2608,'Juguetes de Ciencia',1,72),(2609,'Juguetes de Lenguaje',1,72),(2610,'Juguetes de Habilidad Manual',1,72),(2611,'Muñecas de Trapo',1,73),(2612,'Muñecas de Plástico',1,73),(2613,'Muñecas Interactivas',1,73),(2614,'Muñecas de Colección',1,73),(2615,'Muñecas de Reborn',1,73),(2616,'Figuras de Superhéroes',1,74),(2617,'Figuras de Villanos',1,74),(2618,'Figuras de Animales',1,74),(2619,'Figuras de Robots',1,74),(2620,'Figuras de Ciencia Ficción',1,74),(2621,'Bloques de Construcción',1,75),(2622,'Ladrillos de Construcción',1,75),(2623,'Sets de Construcción',1,75),(2624,'Construcciones Magnéticas',1,75),(2625,'Pistas de Construcción',1,75),(2626,'Juguetes Interactivos',1,76),(2627,'Robots Electrónicos',1,76),(2628,'Juguetes Musicales',1,76),(2629,'Tabletas para Niños',1,76),(2630,'Cámaras para Niños',1,76),(2631,'Ositos de Peluche',1,77),(2632,'Peluches de Animales',1,77),(2633,'Peluches de Personajes',1,77),(2634,'Peluches Musicales',1,77),(2635,'Peluches Interactivos',1,77),(2636,'Juegos de Estrategia',1,78),(2637,'Juegos de Cartas',1,78),(2638,'Juegos de Dados',1,78),(2639,'Juegos de Palabras',1,78),(2640,'Juegos de Aventura',1,78),(2641,'Carros de Juguete',1,79),(2642,'Camiones de Juguete',1,79),(2643,'Motos de Juguete',1,79),(2644,'Trenes de Juguete',1,79),(2645,'Barcos de Juguete',1,79),(2646,'Puzzles de 100 Piezas',1,80),(2647,'Puzzles de 500 Piezas',1,80),(2648,'Puzzles de 1000 Piezas',1,80),(2649,'Puzzles de Madera',1,80),(2650,'Puzzles 3D',1,80),(2651,'Refrigeradores de una puerta',1,81),(2652,'Refrigeradores de dos puertas',1,81),(2653,'Refrigeradores Side-by-Side',1,81),(2654,'Refrigeradores con congelador inferior',1,81),(2655,'Refrigeradores con congelador superior',1,81),(2656,'Lavadoras de carga frontal',1,82),(2657,'Lavadoras de carga superior',1,82),(2658,'Lavadoras con secadora',1,82),(2659,'Lavadoras compactas',1,82),(2660,'Lavadoras industriales',1,82),(2661,'Estufas de gas',1,83),(2662,'Estufas eléctricas',1,83),(2663,'Estufas de inducción',1,83),(2664,'Estufas de cerámica',1,83),(2665,'Estufas con horno',1,83),(2666,'Microondas con grill',1,84),(2667,'Microondas con convección',1,84),(2668,'Microondas básicos',1,84),(2669,'Microondas de mesa',1,84),(2670,'Microondas de empotrar',1,84),(2671,'Licuadoras de vaso',1,85),(2672,'Licuadoras de inmersión',1,85),(2673,'Licuadoras profesionales',1,85),(2674,'Licuadoras portátiles',1,85),(2675,'Licuadoras con procesador',1,85),(2676,'Aspiradoras de trineo',1,86),(2677,'Aspiradoras verticales',1,86),(2678,'Aspiradoras de mano',1,86),(2679,'Aspiradoras robot',1,86),(2680,'Aspiradoras industriales',1,86),(2681,'Planchas de vapor',1,87),(2682,'Planchas secas',1,87),(2683,'Planchas de viaje',1,87),(2684,'Planchas con suela de cerámica',1,87),(2685,'Planchas con ajuste automático de temperatura',1,87),(2686,'Hornos convencionales',1,88),(2687,'Hornos de convección',1,88),(2688,'Hornos de gas',1,88),(2689,'Hornos eléctricos',1,88),(2690,'Hornos empotrables',1,88),(2691,'Cafeteras de goteo',1,89),(2692,'Cafeteras de espresso',1,89),(2693,'Cafeteras de cápsulas',1,89),(2694,'Cafeteras de prensa francesa',1,89),(2695,'Cafeteras automáticas',1,89),(2696,'Ventiladores de pie',1,90),(2697,'Ventiladores de pared',1,90),(2698,'Ventiladores de mesa',1,90),(2699,'Ventiladores de torre',1,90),(2700,'Ventiladores de techo',1,90);
/*!40000 ALTER TABLE `familias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'abcc-articulos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 23:33:21
