-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: jspdb5
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (4,'미코','alzh','미코가 하고 싶은 말','야옹야옹야아아아옹~',9,'2019-06-13',NULL),(6,'롤롤','lolol','롤입니다','롤은 재밌어? 정말?\r\n그렇구나 ~ ',11,'2019-06-14',NULL),(7,'민민','1122','민경','글갯수 업뎃완료!?',0,'2019-06-17',NULL),(8,'miko','miko','미코','안녕하세용',0,'2019-06-17',NULL),(9,'001','001','민경글','글올림',1,'2019-06-17',NULL),(10,'8008','8008','모야모','이건 뭐야~',0,'2019-06-17',NULL),(12,'6633','6633','육','글입니다.',1,'2019-06-17',NULL),(13,'9966','9966','이런글','저런글',1,'2019-06-17',NULL),(14,'1235','1235','무슨글','써야해',3,'2019-06-17',NULL),(15,'1236','1236','뭐지이건','이건뭐야',4,'2019-06-17',NULL),(21,'133','133','null아님','null!아님',7,'2019-06-18','kitty1.jpg'),(22,'123','123','1122','1122',4,'2019-06-18','kitty2.jpg'),(23,'123','123','민경!','플레임포인트',12,'2019-06-18','flamep1.jpg'),(24,'admin','admin','빌딩','빌딩들',5,'2019-07-03','modern4.jpg'),(25,'admin','admin','하잉22','고양이22',3,'2019-07-03',NULL),(26,'admin','admin','고양이33','고양이33',14,'2019-07-03','tulip.jpg'),(27,'admin','admin','하잉','하잉',4,'2019-07-03',NULL),(28,'admin','admin','파일','ㅇㅇ',7,'2019-07-03','GifCam.exe'),(29,'admin','admin','gif','커엽',40,'2019-07-03','tokki.gif');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board2`
--

DROP TABLE IF EXISTS `board2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board2` (
  `num` int(11) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board2`
--

LOCK TABLES `board2` WRITE;
/*!40000 ALTER TABLE `board2` DISABLE KEYS */;
INSERT INTO `board2` VALUES (1,'egg','egg','egg','2019-06-26','egg'),(2,'egg','egg','egg','2019-06-26','egg'),(3,'egg','eggg','eggg','2019-06-26','egg'),(4,'egg','egggg','egggg','2019-06-26','egg'),(5,'egg','eggggg','gggg','2019-06-26','egg'),(6,'egg','eggggg','eggggg','2019-06-26','egg'),(7,'pro','pro','pro','2019-06-27','pro'),(10,'pro','민경','민경','2019-06-27','pro'),(11,'admin','민경이잉','안뇨옹','2019-07-01','admin');
/*!40000 ALTER TABLE `board2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `parent_num` int(11) DEFAULT NULL,
  `id` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `idx_UNIQUE` (`idx`),
  KEY `parent_num_idx` (`parent_num`),
  CONSTRAINT `parent_num` FOREIGN KEY (`parent_num`) REFERENCES `board` (`num`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'하잉하잉',29,'admin','2019-07-10'),(2,'하잉하잉',29,'admin',NULL),(3,'adf',29,'admin','2019-07-10'),(4,'adf',29,'admin','2019-07-10'),(5,'??~',29,'admin','2019-07-10'),(6,'hi there!',29,'admin','2019-07-10'),(7,'sup',29,'admin','2019-07-10'),(8,'yo',29,'admin','2019-07-10');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(23) NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,' 민경',1,'11011-1'),(2,'자두',13,'1010-0101'),(3,'ad',1,'12-121');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `reg_date` datetime DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `post` int(11) DEFAULT NULL,
  `userEmailChecked` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','admin','어드민','admin@admin','2019-07-05 14:18:28','경북 김천시 어모면 은기길 94, 어드민 11호','051-555-4415','010-8441-5101',39503,NULL),('akak','akak','민경이','ak@ak','2019-06-18 16:34:27','akakak','010-8888-9999','',NULL,NULL),('apple','apple','사과','apple@apple.com','2019-06-04 13:54:02',NULL,NULL,NULL,NULL,NULL),('ee','ee','이이','ee@ee','2019-07-05 17:10:21','부산 금정구 부산대학로49번길 46-5, 102호','010-5588-7744','010-3366-4415',46293,NULL),('egg','egg','egg','egg@e','2019-06-26 09:28:21','egg','010-5555-8888','010-9999-8888',NULL,NULL),('lee','lee','리리','lee@lee','2019-07-04 15:04:21','null 7층','010-9888-7845','010-4546-7877',NULL,NULL),('mimi','mimi','강미미','mimi@naver.com','2019-05-31 16:57:47',NULL,NULL,NULL,NULL,NULL),('ming','ming','밍','ming@ming.com','2019-05-31 10:04:23',NULL,NULL,NULL,NULL,NULL),('pro','pro','프로','pro@pro','2019-06-27 14:12:50','progress','010-888-9999','',NULL,NULL),('qq','qqq','큐큐','qq@qq','2019-07-04 15:26:21','서울 용산구 만리재로 152, 805호','010-8855-4411','010-3222-5211',4302,NULL),('rere','rere','레레','rere@rere','2019-07-04 15:15:46','부산 부산진구 가야대로 554 12동 12호','010-8855-4545','010-8784-5653',47329,NULL),('roro','roro','로로','roro@roro','2019-07-04 15:17:59','경남 창원시 성산구 성주로97번길 34, 1동 로로호','010-5511-7788','010-8855-4412',51538,NULL),('rr','rr','알알','rr@rr','2019-07-04 15:45:12','부산 사상구 광장로56번길 48-11, 501호','010-8877-4411','010-3322-2102',46976,NULL),('rr1','rr','리링','ll@ll','2019-07-04 16:19:57','서울 은평구 은평로14길 10-7, 4동 101호','010-8855-4411','',3471,NULL),('s1','s1','s1','rnjsalst@gmail.com','2019-07-08 15:00:30','부산 동래구 구만덕로 172, 2층','','',47718,0),('soso','soso','소소','soso@naver.com','2019-05-31 09:38:16',NULL,NULL,NULL,NULL,NULL),('sss','sss','송송','sss@sss.com','2019-05-31 16:11:44',NULL,NULL,NULL,NULL,NULL),('ww','www','더블','ww@ww','2019-07-04 15:27:38','부산 동래구 미남로146번길 24, 5층 404호','010-2315-4315','010-4151-4513',47822,NULL),('xcxc','xcxc','xcxc','xcxc@xcxc.com','2019-07-09 17:33:03','부산 금정구 금샘로 361, 5층','','',46235,0),('xoxo','xoxo','쏘쏘','ssosso@naver.com','2019-05-31 16:59:14',NULL,NULL,NULL,NULL,NULL),('zz11','zz11','zz11','smg362@naver.com','2019-07-08 15:50:20','경북 김천시 어모면 은기길 94, 105호','','',39503,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_join_0628`
--

DROP TABLE IF EXISTS `member_join_0628`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_join_0628` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `hobby` varchar(20) NOT NULL,
  PRIMARY KEY (`num`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_join_0628`
--

LOCK TABLES `member_join_0628` WRITE;
/*!40000 ALTER TABLE `member_join_0628` DISABLE KEYS */;
INSERT INTO `member_join_0628` VALUES (1,'민경','mk2','mk2','mk2@naver.com','여',''),(2,'민경','mee','mee','mee@naver.com','여',''),(3,'mink','mink','mink','mink@nate.com','여',''),(4,'me','me','me','me@naver.com','여','여행/'),(5,'민경','minkk','minkk','minkk@naver.com','여',''),(6,'mm','mm','mm','mm@gmail.com','여',''),(7,'a','a','a','a@naver.com','여','여행/'),(8,'mk','mk','mk','mk@itwillbs.co.kr','여',''),(9,'ml','ml','ml','ml@nate.com','남','여행/게임/공부/'),(10,'jk','jk','jk','jk@naver.com','여','게임/공부/'),(11,'as','as','as','sa@naver.com','여','게임/공부'),(12,'밍밍','ming','ming','ming@naver.com','여','여행/게임/공부'),(13,'루루','ruru','ruru','ruru@naver.com','여','게임/공부');
/*!40000 ALTER TABLE `member_join_0628` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `num` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0,'몰라'),(1,'Mike'),(2,'삼길동'),(11,'alsrud'),(12,'만굥'),(33,'민경'),(34,'많다'),(55,'민경'),(122,'민경');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `idx` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `jumin` varchar(14) NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `jumin` (`jumin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-10  2:20:05
