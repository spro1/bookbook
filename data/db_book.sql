-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_book
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `badge_list`
--

DROP TABLE IF EXISTS `badge_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge_list` (
  `badge_list` int NOT NULL AUTO_INCREMENT COMMENT '뱃지 ID',
  `user_id` int NOT NULL COMMENT '유저 ID',
  `badge_name` varchar(45) NOT NULL COMMENT '뱃지 이름',
  `badge_grade` int NOT NULL COMMENT '등급',
  PRIMARY KEY (`badge_list`),
  KEY `FK_badge_list_user_id_user_info_user_id` (`user_id`),
  CONSTRAINT `FK_badge_list_user_id_user_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='뱃지 리스트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_list`
--

LOCK TABLES `badge_list` WRITE;
/*!40000 ALTER TABLE `badge_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_list`
--

DROP TABLE IF EXISTS `book_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_list` (
  `book_id` int NOT NULL AUTO_INCREMENT COMMENT '독서록 ID',
  `user_id` int NOT NULL COMMENT '유저 ID(FK)',
  `book_info` json DEFAULT NULL COMMENT 'API 책 정보',
  `book_start` datetime NOT NULL COMMENT '읽기 시작한 날',
  `book_end` datetime NOT NULL COMMENT '다 읽은 날',
  `book_title` varchar(100) NOT NULL COMMENT '독서록 제목',
  `book_content` text NOT NULL COMMENT '감상평',
  `book_like` int NOT NULL DEFAULT '0' COMMENT '좋아요 수',
  PRIMARY KEY (`book_id`),
  KEY `FK_book_list_user_id_user_info_user_id` (`user_id`),
  CONSTRAINT `FK_book_list_user_id_user_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='독서록 리스트 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_list`
--

LOCK TABLES `book_list` WRITE;
/*!40000 ALTER TABLE `book_list` DISABLE KEYS */;
INSERT INTO `book_list` VALUES (1,1,'{\"url\": \"https://search.daum.net/search?w=bookpage&bookId=1467038&q=%EB%AF%B8%EC%9B%80%EB%B0%9B%EC%9D%84+%EC%9A%A9%EA%B8%B0\", \"isbn\": \"8996991341 9788996991342\", \"price\": 14900, \"title\": \"미움받을 용기\", \"status\": \"정상판매\", \"authors\": [\"기시미 이치로\", \"고가 후미타케\"], \"contents\": \"어두워 사람들과 쉽게 친해지지 못하는 사람이 있다. 언제까지 다른 사람들과의 관계 때문에 전전긍긍하며 살아야 할지, 그는 오늘도 고민이다. 이런 그의 고민에 “인간은 변할 수 있고, 누구나 행복해 질 수 있다. 단 그러기 위해서는 ‘용기’가 필요하다”고 말한 철학자가 있다. 바로 프로이트, 융과 함께 ‘심리학의 3대 거장’으로 일컬어지고 있는 알프레드 아들러다.  『미움받을 용기』는 아들러 심리학에 관한 일본의 1인자 철학자 기시미 이치로와 베스트셀러 작가\", \"datetime\": \"2014-11-17T00:00:00.000+09:00\", \"publisher\": \"인플루엔셜\", \"thumbnail\": \"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1467038%3Ftimestamp%3D20201115134144\", \"sale_price\": 13410, \"translators\": [\"전경아\"]}','2020-11-10 00:00:00','2020-11-16 00:00:00','첫 독서록','근데 내용은 몰라',0),(2,1,'{\"url\": \"https://search.daum.net/search?w=bookpage&bookId=3761642&q=%EB%A7%88%ED%9D%94%EC%97%90%EA%B2%8C\", \"isbn\": \"1130619303 9791130619309\", \"price\": 14000, \"title\": \"마흔에게\", \"status\": \"정상판매\", \"authors\": [\"기시미 이치로\"], \"contents\": \"아들러 심리학의 1인자이자 플라톤 철학의 대가, 《미움받을 용기》의 저자 기시미 이치로가 나이 들어가는 삶을 둘러싼 문제에 대해 이야기하는 『마흔에게』. 나이 오십에 심근경색으로 쓰러진 후 심장에 대체 혈관을 연결하는 대수술을 받고 죽음의 문턱까지 간 저자의 인생철학이 담긴 책이다.  수술 후 재활에 몰두하게 된 저자는 많은 일들을 할 수 없는 시간이 다가와도 할 수 있는 일은 남아 있고, 포기하지만 않는다면 할 수 있는 일은 생각 이상으로 많다는 것\", \"datetime\": \"2018-10-05T00:00:00.000+09:00\", \"publisher\": \"다산초당\", \"thumbnail\": \"https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F3761642%3Ftimestamp%3D20201116125929\", \"sale_price\": 12600, \"translators\": [\"전경아\"]}','2020-11-15 00:00:00','2020-11-16 00:00:00','두번째 독서록','이거도 내용 몰라',0);
/*!40000 ALTER TABLE `book_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_list`
--

DROP TABLE IF EXISTS `interest_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest_list` (
  `interest_id` int NOT NULL AUTO_INCREMENT COMMENT '관심있는 책 ID',
  `user_id` int NOT NULL COMMENT '유저 ID',
  `book_info` json NOT NULL COMMENT 'API 책 정보',
  PRIMARY KEY (`interest_id`),
  KEY `FK_interest_list_user_id_user_info_user_id` (`user_id`),
  CONSTRAINT `FK_interest_list_user_id_user_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='관심있는 책 리스트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_list`
--

LOCK TABLES `interest_list` WRITE;
/*!40000 ALTER TABLE `interest_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `interest_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_list`
--

DROP TABLE IF EXISTS `read_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_list` (
  `reading_id` int NOT NULL AUTO_INCREMENT COMMENT '읽은 책 ID',
  `user_id` int NOT NULL COMMENT '유저 ID',
  `book_info` json NOT NULL COMMENT 'API 책 정보',
  PRIMARY KEY (`reading_id`),
  KEY `FK_read_list_user_id_user_info_user_id` (`user_id`),
  CONSTRAINT `FK_read_list_user_id_user_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='읽은 책 리스트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_list`
--

LOCK TABLES `read_list` WRITE;
/*!40000 ALTER TABLE `read_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `read_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '유저 ID(PK)',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '유저 이름',
  `user_email` varchar(45) NOT NULL COMMENT '유저 이메일',
  `user_session` text COMMENT '유저 세션정보',
  `user_platform` int DEFAULT NULL COMMENT '유저 플랫폼(네이버, 카카오)',
  `user_token` text COMMENT '유저 토큰값',
  `user_age` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '유저 나이',
  `platform_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='유저 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'홍길동','hong@gmail.com',NULL,1,NULL,'20-39',NULL),(2,'흥부','heung@gmail.com',NULL,1,NULL,'10-19',NULL),(3,NULL,'spro1@naver.com',NULL,NULL,NULL,NULL,69954200);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_book'
--

--
-- Dumping routines for database 'db_book'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-20 19:45:17
