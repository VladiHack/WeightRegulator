-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for fitness
CREATE DATABASE IF NOT EXISTS `fitness` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `fitness`;

-- Dumping structure for table fitness.exercise
CREATE TABLE IF NOT EXISTS `exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `exercise_type` enum('arms','legs','back') DEFAULT NULL,
  `easy_difficulty` int(11) DEFAULT NULL,
  `intermediate_difficulty` int(11) DEFAULT NULL,
  `hard_difficulty` int(11) DEFAULT NULL,
  `exercise_measurement_type` enum('seconds','times') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fitness.exercise: ~15 rows (approximately)
INSERT INTO `exercise` (`id`, `name`, `exercise_type`, `easy_difficulty`, `intermediate_difficulty`, `hard_difficulty`, `exercise_measurement_type`) VALUES
	(1, 'Barbell biceps curls', 'arms', 32, 40, 48, 'times'),
	(2, 'Cable triceps extension', 'arms', 24, 30, 36, 'times'),
	(3, 'Dumbbell hammer curls', 'arms', 16, 20, 24, 'times'),
	(4, 'Bench dumbbell triceps extensions', 'arms', 32, 40, 48, 'times'),
	(5, 'Wrist flexion', 'arms', 8, 10, 12, 'times'),
	(6, 'Squat to press', 'legs', 15, 20, 25, 'times'),
	(7, 'Single-leg dumbbell scaption', 'legs', 10, 15, 20, 'seconds'),
	(8, 'Lunges', 'legs', 10, 25, 45, 'times'),
	(9, 'Step ups', 'legs', 15, 20, 30, 'times'),
	(10, 'Calf raises', 'legs', 30, 45, 60, 'times'),
	(11, 'Glute bridge', 'back', 30, 45, 60, 'seconds'),
	(12, 'Knees to chest', 'back', 30, 60, 120, 'seconds'),
	(13, 'Child\'s pose', 'back', 30, 60, 90, 'seconds'),
	(14, 'Kettlebell Swings', 'back', 15, 30, 45, 'times'),
	(15, 'Barbell Deadlift', 'back', 18, 24, 36, 'times');

-- Dumping structure for table fitness.routine
CREATE TABLE IF NOT EXISTS `routine` (
  `routine_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` date DEFAULT NULL,
  `date_finished` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `count_workouts` int(11) DEFAULT NULL,
  PRIMARY KEY (`routine_id`),
  KEY `routine_user` (`user_id`),
  CONSTRAINT `routine_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fitness.routine: ~23 rows (approximately)
INSERT INTO `routine` (`routine_id`, `date_start`, `date_finished`, `user_id`, `count_workouts`) VALUES
	(183, '2023-03-03', NULL, 18, 0),
	(222, '2023-03-11', NULL, 22, 1),
	(223, '2023-02-26', NULL, 22, 1),
	(231, '2023-02-26', NULL, 23, 1),
	(233, '2023-03-11', NULL, 23, 1),
	(242, '2023-02-26', NULL, 24, 0),
	(253, '2023-02-26', NULL, 25, 0),
	(263, '2023-02-26', NULL, 26, 0),
	(273, '2023-02-26', NULL, 27, 0),
	(282, '2023-02-26', NULL, 28, 2),
	(293, '2023-02-26', NULL, 29, 1),
	(301, '2023-03-10', NULL, 30, 11),
	(302, '2023-03-10', NULL, 30, 10),
	(303, '2023-02-26', '2023-03-12', 30, 29),
	(311, '2023-03-03', NULL, 31, 1),
	(323, '2023-03-03', NULL, 32, 0),
	(331, '2023-03-04', NULL, 33, 0),
	(343, '2023-03-04', NULL, 34, 0),
	(352, '2023-03-04', NULL, 35, 0),
	(363, '2023-03-04', NULL, 36, 1),
	(391, '2023-03-11', NULL, 39, 1),
	(423, '2023-03-12', NULL, 42, 1),
	(431, '2023-03-12', NULL, 43, 1),
	(443, '2023-03-12', NULL, 44, 1);

-- Dumping structure for table fitness.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') DEFAULT NULL,
  `height` double DEFAULT NULL,
  `height_type` enum('cm','inches') DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fitness.user: ~19 rows (approximately)
INSERT INTO `user` (`user_id`, `user_name`, `email`, `password`, `gender`, `height`, `height_type`) VALUES
	(18, 'randomUser', 'didntKnowWhatToType@gmail.com', 'randomPass123', 'f', 178, 'cm'),
	(22, 'DarkWizard64', 'LetsDoMagic@gmail.com', 'hogwartsGryffindor', 'm', 14, 'inches'),
	(23, 'fitnessManiac', 'fitnessManiac@gmail.com', 'abcdEf1', 'm', 180, 'cm'),
	(24, 'fitnessLover2005', 'fitnessLover2005@gmail.com', '1234567', 'm', 190, 'cm'),
	(25, 'Ivan Petrov', 'IvanPetrov@gmail.com', '1235ASDBV', 'm', 191, 'cm'),
	(26, 'FutureInvador230', 'FutureInvador230@gmail.com', 'Q@OK#213', 'f', 10, 'inches'),
	(27, 'HumptyDumpty2008', 'HumptyDumpty2008@gmail.com', 'aklsdopa213', 'f', 168, 'cm'),
	(28, 'MonkeyBusiness', 'MonkeyBusiness@gmail.com', 'paowoe213', 'm', 16, 'inches'),
	(29, 'Marsianec', 'columbus92@gmail.com', 'dasd2123', 'f', 180, 'cm'),
	(30, 'fatCamper', 'fatCamper@gmail.com', 'pastet12345', 'f', 180, 'cm'),
	(31, 'Peterson', 'peterson@gmail.com', '12345678', 'm', 190, 'cm'),
	(32, 'Peter', 'peter@gmail.com', 'peterLOL123', 'm', 180, 'cm'),
	(33, 'userPotato', 'userPotato@gmail.com', 'userPotato12345', 'm', 180, 'cm'),
	(34, 'justAnotherRandom', 'justAnotherRandom@gmail.com', '1231239u', 'm', 180, 'cm'),
	(35, 'QueenFanBoy', 'QueenFanBoy@gmail.com', 'passIsnotRevealed', 'm', 180, 'cm'),
	(36, 'NewUserFitness', 'NewUserFitness@gmail.com', '1234599123', 'm', 190, 'cm'),
	(37, 'newTestUser', 'newTestUser@gmail.com', '12345789', 'm', 9, 'inches'),
	(38, 'NewUserr', 'NewUserr@gmail.com', '091230@P#O@#', 'f', 168, 'cm'),
	(39, 'userNewUser', 'userNewUser@gmail.com', 'pass12345', 'm', 180, 'cm'),
	(41, 'brandNewUser', 'brandNewUser@gmail.com', '12345678', 'm', 180, 'cm'),
	(42, 'newRandomuser', 'newRandomuser@gmail', '12345678', 'm', 180, 'cm'),
	(43, 'nqkakvoIme', 'nqkakvoIme@gmail.com', 'pass12345', 'm', 180, 'cm'),
	(44, 'Irka', 'irka@gmail.com', 'irka123', 'f', 160, 'cm');

-- Dumping structure for table fitness.weight
CREATE TABLE IF NOT EXISTS `weight` (
  `workout_id` int(11) NOT NULL AUTO_INCREMENT,
  `current_weight` double DEFAULT NULL,
  `routine_id` int(11) DEFAULT NULL,
  `date_measure` date DEFAULT NULL,
  `weight_type` enum('pounds','kg') DEFAULT NULL,
  PRIMARY KEY (`workout_id`) USING BTREE,
  KEY `weight_routine` (`routine_id`),
  CONSTRAINT `weight_routine` FOREIGN KEY (`routine_id`) REFERENCES `routine` (`routine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fitness.weight: ~27 rows (approximately)
INSERT INTO `weight` (`workout_id`, `current_weight`, `routine_id`, `date_measure`, `weight_type`) VALUES
	(4, 90, 293, '2023-02-26', 'pounds'),
	(5, 100.34, 303, '2023-02-26', 'kg'),
	(6, 90, 311, '2023-03-03', 'kg'),
	(7, 200, 183, '2023-03-03', 'pounds'),
	(8, 120, 323, '2023-03-03', 'kg'),
	(22, 100, 303, '2023-03-03', 'kg'),
	(23, 120, 303, '2023-03-04', 'kg'),
	(24, 90, 183, '2023-03-04', 'kg'),
	(25, 90, 311, '2023-03-04', 'kg'),
	(35, 100, 352, '2023-03-04', 'kg'),
	(37, 90, 363, '2023-03-04', 'kg'),
	(38, 79, 303, '2023-03-05', 'kg'),
	(39, 100, 183, '2023-03-05', 'kg'),
	(40, 69, 282, '2023-03-05', 'kg'),
	(41, 60, 303, '2023-03-08', 'kg'),
	(42, 90, 311, '2023-03-08', 'kg'),
	(43, 69, 282, '2023-03-08', 'kg'),
	(47, 100, 301, '2023-03-10', 'kg'),
	(48, 90, 293, '2023-03-10', 'kg'),
	(94, 78.43, 303, '2023-03-11', 'kg'),
	(95, 78.43, 301, '2023-03-11', 'kg'),
	(96, 78.43, 302, '2023-03-11', 'kg'),
	(97, 78.43, 302, '2023-03-11', 'kg'),
	(98, 70, 423, '2023-03-12', 'kg'),
	(99, 70, 302, '2023-03-12', 'kg'),
	(100, 70, 301, '2023-03-12', 'kg'),
	(101, 70, 431, '2023-03-12', 'kg'),
	(102, 70, 303, '2023-03-12', 'kg'),
	(103, 70, 303, '2023-03-12', 'kg'),
	(104, 60, 443, '2023-03-12', 'kg');

-- Dumping structure for table fitness.workout
CREATE TABLE IF NOT EXISTS `workout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_workout` date DEFAULT NULL,
  `type_workout` enum('arms','legs','back') DEFAULT NULL,
  `routine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stats_exercise` (`routine_id`),
  CONSTRAINT `stats_exercise` FOREIGN KEY (`routine_id`) REFERENCES `routine` (`routine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fitness.workout: ~58 rows (approximately)
INSERT INTO `workout` (`id`, `date_workout`, `type_workout`, `routine_id`) VALUES
	(1, '2023-03-04', 'legs', 303),
	(2, '2023-03-04', 'arms', 363),
	(3, '2023-03-05', 'back', 282),
	(4, '2023-03-05', 'back', 303),
	(5, '2023-03-05', 'legs', 303),
	(6, '2023-03-05', 'legs', 303),
	(7, '2023-03-05', 'legs', 303),
	(8, '2023-03-05', 'legs', 303),
	(9, '2023-03-05', 'back', 303),
	(10, '2023-03-08', 'back', 303),
	(11, '2023-03-08', 'back', 303),
	(12, '2023-03-08', 'arms', 303),
	(13, '2023-03-08', 'arms', 303),
	(14, '2023-03-08', 'back', 303),
	(15, '2023-03-08', 'arms', 311),
	(16, '2023-03-08', 'legs', 282),
	(17, '2023-03-10', 'back', 301),
	(18, '2023-03-10', 'arms', 303),
	(19, '2023-03-10', 'arms', 303),
	(20, '2023-03-10', 'legs', 302),
	(21, '2023-03-10', 'arms', 303),
	(22, '2023-03-10', 'back', 293),
	(23, '2023-03-11', 'back', 301),
	(24, '2023-03-11', 'back', 303),
	(27, '2023-03-11', 'arms', 223),
	(28, '2023-03-11', 'back', 222),
	(29, '2023-03-11', 'arms', 391),
	(30, '2023-03-11', 'back', 343),
	(31, '2023-03-11', 'legs', 233),
	(32, '2023-03-11', 'legs', 231),
	(34, '2023-03-11', 'back', 302),
	(35, '2023-03-11', 'legs', 301),
	(36, '2023-03-11', 'back', 301),
	(37, '2023-03-11', 'back', 301),
	(38, '2023-03-11', 'back', 303),
	(39, '2023-03-11', 'arms', 303),
	(40, '2023-03-11', 'legs', 301),
	(41, '2023-03-11', 'legs', 301),
	(42, '2023-03-11', 'back', 301),
	(43, '2023-03-11', 'back', 302),
	(44, '2023-03-11', 'back', 303),
	(45, '2023-03-11', 'back', 303),
	(46, '2023-03-11', 'back', 303),
	(47, '2023-03-11', 'legs', 303),
	(48, '2023-03-11', 'arms', 303),
	(49, '2023-03-11', 'arms', 303),
	(50, '2023-03-11', 'back', 303),
	(51, '2023-03-11', 'legs', 303),
	(52, '2023-03-11', 'legs', 303),
	(53, '2023-03-11', 'back', 303),
	(54, '2023-03-11', 'arms', 303),
	(55, '2023-03-12', 'legs', 423),
	(56, '2023-03-12', 'arms', 302),
	(57, '2023-03-12', 'back', 302),
	(58, '2023-03-12', 'arms', 302),
	(59, '2023-03-12', 'back', 301),
	(60, '2023-03-12', 'back', 302),
	(61, '2023-03-12', 'legs', 431),
	(62, '2023-03-12', 'arms', 302),
	(63, '2023-03-12', 'back', 301),
	(64, '2023-03-12', 'arms', 443);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
