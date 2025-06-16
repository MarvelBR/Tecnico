CREATE DATABASE  IF NOT EXISTS `lp3_2bim` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lp3_2bim`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: lp3_2bim
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `casa`
--

DROP TABLE IF EXISTS `casa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casa` (
  `nome_casa` varchar(45) NOT NULL,
  `cor_casa` varchar(45) NOT NULL,
  PRIMARY KEY (`nome_casa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casa`
--

LOCK TABLES `casa` WRITE;
/*!40000 ALTER TABLE `casa` DISABLE KEYS */;
INSERT INTO `casa` VALUES ('Corvinal','Azul'),('Grifinoria','Vermelha'),('Lufa Lufa','Amarela'),('Sonserina','Verde');
/*!40000 ALTER TABLE `casa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `pessoa_email` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `rua_avenida` varchar(45) NOT NULL,
  `numero_casa` int NOT NULL,
  PRIMARY KEY (`pessoa_email`),
  CONSTRAINT `fk_cliente_pessoa1` FOREIGN KEY (`pessoa_email`) REFERENCES `pessoa` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('a','Brasil','Paraná','Rua Panambi',2405);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `pessoa_email` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`pessoa_email`),
  CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`pessoa_email`) REFERENCES `pessoa` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('c','Programador');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrono`
--

DROP TABLE IF EXISTS `patrono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrono` (
  `animal` varchar(45) NOT NULL,
  `tamanho` varchar(45) NOT NULL,
  PRIMARY KEY (`animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrono`
--

LOCK TABLES `patrono` WRITE;
/*!40000 ALTER TABLE `patrono` DISABLE KEYS */;
INSERT INTO `patrono` VALUES ('Dragao','Grande'),('lontra','mediana'),('Unicornio','Mediano'),('Urso','Mediano');
/*!40000 ALTER TABLE `patrono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `email` varchar(45) NOT NULL,
  `nome_pessoa` varchar(45) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `senha` varchar(45) NOT NULL,
  `varinha_nome_varinha` varchar(45) NOT NULL,
  `casa_nome_casa` varchar(45) NOT NULL,
  `patrono_animal` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_pessoa_varinha_idx` (`varinha_nome_varinha`),
  KEY `fk_pessoa_casa1_idx` (`casa_nome_casa`),
  KEY `fk_pessoa_patrono1_idx` (`patrono_animal`),
  CONSTRAINT `fk_pessoa_casa1` FOREIGN KEY (`casa_nome_casa`) REFERENCES `casa` (`nome_casa`),
  CONSTRAINT `fk_pessoa_patrono1` FOREIGN KEY (`patrono_animal`) REFERENCES `patrono` (`animal`),
  CONSTRAINT `fk_pessoa_varinha` FOREIGN KEY (`varinha_nome_varinha`) REFERENCES `varinha` (`nome_varinha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('a','Erick','2005-03-01','1234','Varinha do Voldemort','Lufa Lufa','Unicornio'),('b','aaaaaa','1111-11-11','aaaaa','Varinha do Rony','Corvinal','lontra'),('c','aaaaaa','1212-12-22','aaa','varinha do harry','Lufa Lufa','Dragao'),('d','aaaaaaaaaaaa','1111-11-11','aaaa','Varinha do Rony','Corvinal','Unicornio'),('e','aaaaaaaa','1111-11-11','aaaaaaaaaa','varinha do harry','Sonserina','Dragao'),('f','aaaaaaaaaaa','1111-11-11','asdawdas','varinha do harry','Corvinal','Dragao'),('hh','awdasd','1111-11-11','awdadsa','Varinha do Voldemort','Sonserina','Unicornio'),('xxxx','aaaaaaaaa','1111-11-11','aaaaaaaa','varinha do harry','Corvinal','Dragao'),('z','aaaaa','1111-11-11','aaaaaa','Varinha do Voldemort','Sonserina','lontra'),('zzz','adawdasd','1111-11-11','aaaaa','Varinha do Rony','Sonserina','lontra'),('zzzzzzzzzzzzzzzzzz','dawdasdaw','1111-11-11','aaaaaaaaaa','Varinha do Rony','Corvinal','Unicornio');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varinha`
--

DROP TABLE IF EXISTS `varinha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varinha` (
  `nome_varinha` varchar(45) NOT NULL,
  `madeira` varchar(45) NOT NULL,
  `nucleo` varchar(45) NOT NULL,
  `tamanho_cm` double NOT NULL,
  `quebrada` tinyint NOT NULL,
  PRIMARY KEY (`nome_varinha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varinha`
--

LOCK TABLES `varinha` WRITE;
/*!40000 ALTER TABLE `varinha` DISABLE KEYS */;
INSERT INTO `varinha` VALUES ('varinha do harry','carvalho','pena de fenix',24,1),('Varinha do Rony','Carvalho Escuro','Coracao de Dragao',19,0),('Varinha do Voldemort','Eucalipto','Pena de  fenix',24,1);
/*!40000 ALTER TABLE `varinha` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06 20:10:33
