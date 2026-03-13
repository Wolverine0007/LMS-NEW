-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2026 at 06:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_floated` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `message`, `created_at`, `is_floated`) VALUES
(33, '🕒 Library timings updated! Open 8 AM to 8 PM, Sunday closed. 🛑', '2025-06-07 17:35:35', 1),
(34, '📖 Manage your issued books and fines easily with our new system! 💻', '2025-06-07 17:36:04', 1),
(35, '📚 View your issued books and detailed history anytime, all in one place.', '2025-06-07 17:36:39', 1),
(36, '🧑‍🎓 Manage student profiles with ease—add, edit, or view details seamlessly.', '2025-06-07 17:36:55', 0),
(37, '⚙️ Secure and efficient backend powered by PHP and SQL for reliable library operations.', '2025-06-07 17:37:07', 1),
(39, '🚀 This amazing platform is created by Satyam Gaikwad! 🎉', '2025-06-08 06:17:09', 0),
(44, 'Almost complete..!!!🥳🥳🥳', '2026-01-09 09:51:27', 1),
(45, 'gggg', '2026-01-27 09:32:19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `accession_number` varchar(10) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1 COMMENT '1=Available, 0=Issued',
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`accession_number`, `book_id`, `title`, `author`, `publisher`, `price`, `entry_date`, `status`, `is_deleted`) VALUES
('0009', NULL, 'Java Network Programming', 'Harold', 'SPD', 500.00, '2025-12-25 17:56:17', 1, 1),
('0010', NULL, 'Understanding Pointers in C 3rd E', 'Kanetkar', 'BPB', 210.00, '2025-12-25 17:56:17', 1, 1),
('0011', NULL, 'Test your C++ Skills', 'Kanetkar', 'BPB', 180.00, '2025-12-25 17:56:17', 1, 1),
('0012', NULL, 'Test your C Skills', 'Kanetkar', 'BPB', 165.00, '2025-12-25 17:56:17', 1, 1),
('0013', NULL, 'A Programmer’sGuide to Java certification 2nd E w/cd', 'Mughal', 'PEARSON EDU', 550.00, '2025-12-25 17:56:17', 1, 1),
('0015', NULL, 'Understanding the Lunix Kernel 2ndE', 'Bovet', 'SPD', 500.00, '2025-12-25 17:56:17', 1, 1),
('0016', NULL, 'JSP 2.0 the complete ref.', 'Hanna', 'TMH', 495.00, '2025-12-25 17:56:17', 1, 1),
('0017', NULL, 'Java 2 the complete ref. 5th E', 'Schildt', 'TMH', 395.00, '2025-12-25 17:56:17', 0, 0),
('0018', NULL, 'Programming MS.visual C++ 5th E w/cd', 'Kruglinski', 'WP PUBLISHER', 650.00, '2025-12-25 17:56:17', 1, 0),
('0019', NULL, 'Programming Windows with MFC 2nd E w/cd', 'Prosise', 'WP PUBLISHER', 750.00, '2025-12-25 17:56:17', 1, 0),
('0020', NULL, 'Programming windows 5th E w/CD', 'Petzold', 'WP PUBLISHER', 725.00, '2025-12-25 17:56:17', 1, 0),
('0021', NULL, 'Compilers', 'Aho', 'PEARSON EDU', 399.00, '2025-12-25 17:56:17', 1, 0),
('0022', NULL, 'Linex Kernel Developer 2nd E', 'Love', 'PEARSON EDU', 295.00, '2025-12-25 17:56:17', 1, 1),
('0023', NULL, 'Linex device drivers 3rd E', 'Corbet', 'SPD', 450.00, '2025-12-25 17:56:17', 1, 0),
('0025', NULL, 'MCSA/MCSE MS  Managing & Maintaining a MS  winds server 2003 environment w/CD', 'Holme', 'PHI', 695.00, '2025-12-25 17:56:17', 0, 0),
('0026', NULL, 'Upgrading your certificate to MS.windows server 2003 w/CD', 'Holme', 'PHI', 895.00, '2025-12-25 17:56:17', 1, 0),
('0027', NULL, 'MCSE Planning, Implementing & maintaining a MS windows server 2003 and active directory infrastructure w/CD', 'Spealman', 'PHI', 695.00, '2025-12-25 17:56:17', 1, 0),
('0028', NULL, 'MCSE designing a MS  windows server 2003 active directory & network infrastructure w/cd', 'Glenn', 'PHI', 595.00, '2025-12-25 17:56:17', 1, 0),
('0029', NULL, 'MCSE Designing security for MS   windows server 2003 network w/CD', 'Bragg', 'PHI', 695.00, '2025-12-25 17:56:17', 1, 0),
('0030', NULL, 'MCSA/MCSE implementing & administering security in a MS  windows server’ 03 network w/cd', 'Northrup', 'SPD', 695.00, '2025-12-25 17:56:17', 1, 0),
('0031', NULL, 'Network security tools', 'Dhanjani', 'PEARSON EDU', 350.00, '2025-12-25 17:56:17', 1, 1),
('0032', NULL, 'CCNP 4. Network troubleshooting lab companion', 'PE  CNAP', 'PEARSON EDU', 199.00, '2025-12-25 17:56:17', 1, 0),
('0033', NULL, 'Computer networks & Internets w/cd 4th E', 'Comer', 'PEARSON EDU', 325.00, '2025-12-25 17:56:17', 1, 0),
('0034', NULL, 'C++Primer 3rd E', 'Lippman', 'PEARSON EDU', 450.00, '2025-12-25 17:56:17', 1, 0),
('0035', NULL, 'Advance unix a programmer’s guide', 'Prata', 'BPB', 225.00, '2025-12-25 17:56:17', 1, 0),
('0036', NULL, 'The C Puzzle book', 'Feuer', 'PEARSON EDU', 125.00, '2025-12-25 17:56:17', 1, 0),
('0037', NULL, 'The design of the unix operation system', 'Bach', 'PEARSON EDU', 195.00, '2025-12-25 17:56:17', 0, 0),
('0038', NULL, 'Writing TSR’s through C', 'Kanetkar', 'BPB', 225.00, '2025-12-25 17:56:17', 1, 0),
('0039', NULL, 'C Projects w/d', 'Kanetkar', 'BPB', 300.00, '2025-12-25 17:56:17', 0, 0),
('0040', NULL, 'Linux kernel programme 3rd E w/CD', 'Beck', 'PEARSON EDU', 395.00, '2025-12-25 17:56:17', 1, 0),
('0041', NULL, 'Unix system administration h/bk 3rd E', 'Nemeth', 'PEARSON EDU', 495.00, '2025-12-25 17:56:17', 1, 0),
('0042', NULL, 'Network Programme for MS. Windows w/CD', 'Jones', 'S CHAND& GROUP', 600.00, '2025-12-25 17:56:17', 1, 0),
('0043', NULL, 'Quantitative aptitude', 'Aggarwal', 'ORIENT PAPER BACKS', 315.00, '2025-12-25 17:56:17', 0, 0),
('0044', NULL, 'Puzzles to puzzle you', 'Devi Shakuntala', 'TMH', 55.00, '2025-12-25 17:56:17', 1, 0),
('0045', NULL, 'Elements of Discrete Mathematics', 'Liu', 'TMH', 250.00, '2025-12-25 17:56:17', 1, 0),
('0046', NULL, 'Digital Signal Processing (3rd edition)', 'Sanjit .K. Mitra', 'TMH', 250.00, '2025-12-25 17:56:17', 0, 0),
('0047', NULL, 'Artificial Intelligence A Modern Approach(2nd edition)', 'Stuart Russel. Peter Norving', 'EEE', 350.00, '2025-12-25 17:56:17', 1, 0),
('0048', NULL, 'Operating Systems (2nd edition)', 'Achyut  S Godbole', 'TMH', 250.00, '2025-12-25 17:56:17', 1, 0),
('0049', NULL, 'Database system concepts', 'Abraham Silberchatz, Henry .F. Korth, S. Sudarshan', 'MGH', 510.00, '2025-12-25 17:56:17', 0, 0),
('0050', NULL, 'Programming and Customizing 8051 Microcontroller', 'Mykepredko', 'TMH', 300.00, '2025-12-25 17:56:17', 1, 0),
('0051', NULL, 'Digital Logic and computer device', 'M.Moris Mano', 'PHI', 250.00, '2025-12-25 17:56:17', 1, 0),
('0052', NULL, 'Advance MS DOS Programming', 'Ray duncan', 'BPB', 390.00, '2025-12-25 17:56:17', 1, 0),
('0053', NULL, 'Elements Of Theory Of Computation', 'Harry R Lewis & Christos H Papadimitriou', 'PHI', 250.00, '2025-12-25 17:56:17', 1, 0),
('0054', NULL, 'Object Oriented and Classical Software Engineering (5th edition)', 'Stephen.R. Schach', 'TMH', 275.00, '2025-12-25 17:56:17', 1, 0),
('0055', NULL, 'Java and Object oriented Paradigm', 'Debasish Jana', 'EEE', 280.00, '2025-12-25 17:56:17', 1, 0),
('0056', NULL, 'Compiler Design', 'Santanu Chattopadhyay', 'EEE', 300.00, '2025-12-25 17:56:17', 1, 0),
('0057', NULL, 'Software Engineering', 'DavidGustafson', 'TMH', 175.00, '2025-12-25 17:56:17', 1, 0),
('0058', NULL, 'Mobile Computing', 'Asoke. K. Talukder, Roopa R .Yavagal', 'TMH', 350.00, '2025-12-25 17:56:17', 1, 0),
('0060', NULL, 'Introduction To Languages And The Theory Of Computation', 'John C Martin', 'TMH', 250.00, '2025-12-25 17:56:17', 1, 0),
('0061', NULL, 'Modern digital Electronics', 'R.P.Jain', 'TMH', 350.00, '2025-12-25 17:56:17', 1, 0),
('0062', NULL, 'Operating System Concepts (6th edition)', 'Silberschatz,Galvin,Gagne', 'John Wiley & Sons. INC', 250.00, '2025-12-25 17:56:17', 1, 0),
('0063', NULL, 'System Programming & Operating System(2nd Revised Edition)', 'D M Dhamdhere', 'TMH', 350.00, '2025-12-25 17:56:17', 1, 0),
('0064', NULL, 'Essay Scorer', 'IMS', 'IMS', 99.00, '2025-12-25 17:56:17', 1, 0),
('0065', NULL, 'The personal Interview. The art of facing Interviews', 'IMS', 'IMS', 100.00, '2025-12-25 17:56:17', 1, 0),
('0066', NULL, 'The New GK power pack', 'IMS', 'IMS', 100.00, '2025-12-25 17:56:17', 1, 0),
('0067', NULL, 'The GD path finder', 'IMS', 'IMS', 100.00, '2025-12-25 17:56:17', 1, 0),
('0068', NULL, 'Advance edge mastering MBA career', 'IMS', 'IMS', 150.00, '2025-12-25 17:56:17', 1, 0),
('0069', NULL, 'Quantitative skill Builder', 'IMS', 'IMS', 150.00, '2025-12-25 17:56:17', 1, 0),
('0070', NULL, 'Project Management', 'Scott Berkun', 'O’Reilly', 200.00, '2025-12-25 17:56:17', 1, 0),
('0071', NULL, 'UNIX Concepts & Applications', 'Sumitabha', 'TMH', 400.00, '2025-12-25 17:56:17', 1, 0),
('0072', NULL, 'Data Structures', 'G A V Pai', 'TMH', 350.00, '2025-12-25 17:56:17', 1, 0),
('0073', NULL, 'Digital Signal Processing', 'Sanjit K. Mitra', 'TMH', 200.00, '2025-12-25 17:56:17', 1, 0),
('0074', NULL, 'Software Engineering 6thEdition', 'Roger S Pressman', 'MGH', 600.00, '2025-12-25 17:56:17', 1, 0),
('0075', NULL, 'Programming Languages _Principles and Paradigms', 'Allan Tucker, Robert Noonan', 'TMH', 275.00, '2025-12-25 17:56:17', 1, 0),
('0076', NULL, 'Fundementals  of Algorithms', 'Giles Brassard/Paul Brately', 'PHI', 225.00, '2025-12-25 17:56:17', 1, 0),
('0077', NULL, 'Internetworking With TCP/IP- vol –1', 'Douglas . E. Comer', 'PHI', 250.00, '2025-12-25 17:56:17', 1, 0),
('0078', NULL, 'Unix Network Programming', 'W.Richard Stevens', 'PHI', 250.00, '2025-12-25 17:56:17', 1, 0),
('0079', NULL, 'Teach Yourself Programming with JDBC', 'Ashton Hobbs', 'Techmedia', 275.00, '2025-12-25 17:56:17', 1, 0),
('0080', NULL, 'The Intel Microprocessor', 'Barry. B. Bray', 'Pearson Wducation', 350.00, '2025-12-25 17:56:17', 1, 0),
('0081', NULL, 'Systems Programming', 'John. J. Donovan', 'TMH', 250.00, '2025-12-25 17:56:17', 1, 0),
('0082', NULL, 'Computer Graphics', 'Steven Harrington', 'MGH', 250.00, '2025-12-25 17:56:17', 1, 0),
('0083', NULL, 'Understanding the Linux Kernel', 'Daniel .P.Bovet', 'O’Reilly', 500.00, '2025-12-25 17:56:17', 1, 0),
('0084', NULL, 'Lex and Yacc', 'John .R.Levine, Tony Mason', 'O’Reilly', 225.00, '2025-12-25 17:56:17', 0, 0),
('0085', NULL, 'Computer Graphics', 'Donald Hearn', 'PHI', 425.00, '2025-12-25 17:56:17', 1, 0),
('0086', NULL, 'Operating Systems Incorporating Unix and Windows', 'Colin Ritchie', 'BPB', 120.00, '2025-12-25 17:56:17', 1, 0),
('0087', NULL, 'MicroComputer Systems: The 8086/8088 family,Architecture, Programming and Design', 'Yu-Chang, Glen A. Gibbson', 'PHI', 195.00, '2025-12-25 17:56:17', 1, 0),
('0088', NULL, 'Artificial Intelligence', 'Elaine Rich, Kevin Knight', 'TMH', 325.00, '2025-12-25 17:56:17', 0, 0),
('0089', NULL, 'Computer Networks and Internet', 'Douglas E Comer', 'Pearson Education', 325.00, '2025-12-25 17:56:17', 1, 0),
('0090', NULL, 'Understanding Unix', 'K. Srirengan', 'PHI', 125.00, '2025-12-25 17:56:17', 1, 0),
('0091', NULL, 'C Under Dos Test', 'Riku Ravik, Anup Jalan, Soham Desai', 'BPB', 95.00, '2025-12-25 17:56:17', 1, 0),
('0092', NULL, 'Unix Concepts and Applications', 'Sumithaba Das', 'TMH', 225.00, '2025-12-25 17:56:17', 1, 0),
('0093', NULL, 'Object Oriented Programming In Turbo C++', 'Robert Lafore', 'Galgotia', 325.00, '2025-12-25 17:56:17', 1, 0),
('0094', NULL, 'VB.NET  Language In a Nut Shell', 'Steven Roman, Ron Petrusha, Paul Lonmax', 'O’Reilly', 350.00, '2025-12-25 17:56:17', 1, 0),
('0095', NULL, 'Object Oriented Programming With C++', 'E. BalaguruSwami', 'TMH', 225.00, '2025-12-25 17:56:17', 1, 0),
('0096', NULL, 'Developing ASP Component', 'Shelly Powers', 'O’Reilly', 500.00, '2025-12-25 17:56:17', 1, 0),
('0097', NULL, 'Thinking In Java', 'Bruce Eckel', 'Pearson Education', 300.00, '2025-12-25 17:56:17', 1, 0),
('0098', NULL, 'Design Methods and Analysis of Algorithms', 'S.K. Basu', 'PHI', 250.00, '2025-12-25 17:56:17', 1, 0),
('0099', NULL, 'J2EE Architecture', 'BV Kumar, Sangeeta, B Subramanya', 'TMH', 380.00, '2025-12-25 17:56:17', 1, 0),
('00998', 2, 'dada', 'Pythagoros', 'adfs', 56.00, '2026-02-02 09:48:08', 1, 0),
('0100', NULL, 'J2EE Architecture', 'BV Kumar, Sangeeta, B Subramanya', 'TMH', 380.00, '2025-12-25 17:56:17', 1, 0),
('1001', 1, 'copy', 'Gottfried', 'A4 mard', 45.00, '2026-02-02 09:32:51', 1, 0),
('1002', 1, 'copy', 'Gottfried', 'A4 mard', 45.00, '2026-02-02 09:33:28', 1, 0),
('1003', 1, 'copy', 'Gottfried', 'A4 mard', 45.00, '2026-02-02 10:06:53', 1, 0),
('1004', 1, 'copy', 'Gottfried', 'A4 mard', 45.00, '2026-02-02 10:12:39', 1, 0),
('1005', 1, 'copy', 'Gottfried', 'A4 mard', 45.00, '2026-02-02 10:26:58', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_master`
--

CREATE TABLE `book_master` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_master`
--

INSERT INTO `book_master` (`book_id`, `title`, `author`, `publisher`) VALUES
(1, 'copy', 'Gottfried', 'A4 mard'),
(2, 'dada', 'Pythagoros', 'adfs');

-- --------------------------------------------------------

--
-- Table structure for table `issued_books`
--

CREATE TABLE `issued_books` (
  `id` int(11) NOT NULL,
  `accession_number` varchar(10) DEFAULT NULL,
  `prn` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=Active/Issued, 0=Returned, 2=Lost/Damaged',
  `issue_date` datetime NOT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issued_books`
--

INSERT INTO `issued_books` (`id`, `accession_number`, `prn`, `status`, `issue_date`, `due_date`, `return_date`, `fine`) VALUES
(2, '0049', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-02', 8),
(3, '0072', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-02', 0),
(4, '0057', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(5, '0038', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-02', 0),
(6, '00998', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(7, '1002', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(8, '1001', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(9, '1005', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(10, '1003', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(11, '1004', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(12, '0011', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-02', 10),
(13, '0011', '202301040138', 0, '2026-02-02 00:00:00', '2026-02-16', '2026-02-03', 0),
(17, '0022', '202301040138', 0, '2026-02-03 00:00:00', '2026-02-17', '2026-02-04', 0),
(18, '0020', '202301040138', 0, '2026-02-03 00:00:00', '2026-02-17', '2026-02-04', 12),
(19, '0067', '202301040138', 0, '2026-02-03 00:00:00', '2026-02-17', '2026-02-04', 90),
(20, '0034', '202301040044', 0, '2026-02-03 00:00:00', '2026-02-17', '2026-02-10', 0),
(21, '0025', '202301040138', 0, '2026-02-03 00:00:00', '2026-02-17', '2026-02-04', 78),
(22, '1001', '202301040138', 0, '2026-02-03 00:00:00', '2026-02-17', '2026-02-04', 123),
(23, '0029', '202301040138', 0, '2026-02-04 00:00:00', '2026-02-18', '2026-02-10', 0),
(24, '0020', '202301040138', 0, '2026-02-04 00:00:00', '2026-02-18', '2026-02-05', 0),
(25, '0038', '202301040138', 0, '2026-02-05 00:00:00', '2026-02-19', '2026-02-09', 0),
(26, '0030', '202301040138', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-09', 0),
(27, '0099', '202301040138', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-09', 0),
(28, '0100', '202301040044', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-09', 0),
(29, '0076', '202301040044', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-10', 0),
(30, '0089', '202301040044', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-10', 0),
(31, '0090', '202301040138', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-09', 0),
(32, '0057', '202301040044', 0, '2026-02-06 00:00:00', '2026-02-01', '2026-02-06', 10),
(33, '0098', '202301040138', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-09', 0),
(34, '0045', '202301040044', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-10', 0),
(35, '00998', '202301040138', 0, '2026-02-06 00:00:00', '2026-02-20', '2026-02-09', 0),
(36, '0068', '202301040138', 0, '2026-02-06 00:00:00', '2026-02-07', '2026-02-09', 4),
(37, '0066', '202301040001', 0, '2026-02-09 00:00:00', '2026-02-23', '2026-02-10', 0),
(38, '0054', '202301040138', 0, '2026-02-09 00:00:00', '2026-02-23', '2026-02-10', 0),
(39, '0028', '202301040001', 0, '2026-02-09 00:00:00', '2026-02-23', '2026-02-10', 0),
(40, '0055', '202301040044', 0, '2026-02-09 00:00:00', '2026-02-23', '2026-02-10', 0),
(42, '0090', '202301040044', 0, '2026-02-09 00:00:00', '2026-02-23', '2026-02-10', 0),
(43, '0088', '202301040004', 1, '2026-02-09 00:00:00', '2026-02-23', NULL, 0),
(44, '0087', '202301040001', 0, '2026-02-09 00:00:00', '2026-02-23', '2026-02-10', 0),
(45, '0046', '202301040006', 1, '2026-02-09 00:00:00', '2026-02-23', NULL, 0),
(46, '0043', '202301040004', 1, '2026-02-09 00:00:00', '2026-02-23', NULL, 0),
(47, '0084', '202301040044', 1, '2026-02-09 00:00:00', '2026-02-23', NULL, 0),
(48, '0017', '202301040001', 0, '2026-02-10 00:00:00', '2026-02-24', '2026-02-10', 0),
(50, '0039', '202301040001', 1, '2026-02-10 00:00:00', '2026-02-24', NULL, 0),
(52, '0017', '202301040138', 0, '2026-02-10 08:47:32', NULL, '2026-02-10', 0),
(53, '0025', '202301040001', 1, '2026-02-10 00:00:00', '2026-02-24', NULL, 0),
(54, '0064', '202301040006', 0, '2026-02-10 00:00:00', '2026-02-24', '2026-02-10', 0),
(57, '0049', '202301040138', 0, '2026-02-10 09:51:55', '2026-02-24', '2026-02-16', 0),
(58, '0098', '202301040138', 0, '2026-02-10 10:00:28', '2026-02-24', '2026-02-16', 0),
(59, '0017', '202301040004', 1, '2026-02-10 13:31:37', '2026-02-24', NULL, 0),
(60, '0032', '20230104005', 0, '2026-02-12 07:42:45', '2026-02-13', '2026-02-16', 6),
(61, '0037', '202301040138', 1, '2026-02-14 23:55:27', '2026-02-28', NULL, 0),
(62, '0049', '202301040138', 1, '2026-02-16 13:47:54', '2026-03-02', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `config_key` varchar(50) NOT NULL,
  `config_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `config_key`, `config_value`) VALUES
(1, 'issue_limit', '8'),
(2, 'branches', 'Computer Engineering,IT,Mechanical,Civil,Chemical,Software'),
(3, 'fine_rate', '2'),
(4, 'fine_rate_late', '7'),
(6, 'mail_account_creation', '1'),
(7, 'mail_book_issuance', '0'),
(8, 'mail_return_reminders', '0'),
(9, 'default_password', '12345678'),
(10, 'default_loan_period', '14');

-- --------------------------------------------------------

--
-- Table structure for table `staff_accounts`
--

CREATE TABLE `staff_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') NOT NULL DEFAULT 'staff',
  `phone` varchar(15) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reset_otp` varchar(10) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_accounts`
--

INSERT INTO `staff_accounts` (`id`, `name`, `email`, `password`, `role`, `phone`, `department`, `created_at`, `updated_at`, `reset_otp`, `otp_expiry`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123', 'admin', '214748364707', 'Technical Department MIT Alandi', '2025-06-06 02:35:57', '2025-11-03 18:46:57', NULL, NULL),
(11, 'staff member', 'staff@gmail.com', '$2y$10$MMFd7x3AEAfEG54/wgUTDuZf3vYA4zABKruP/hkmJzhs.H6p7P9lm', 'staff', '7658273472', NULL, '2026-02-03 10:29:14', '2026-02-04 10:52:27', NULL, NULL),
(20, 'algorithm', 'algorithmseven@gmail.com', '$2y$10$ddud.7WeI3S7XqOTf8njCurvqQRZ5LtIwAouPcet3a7yUPAmrhmJ.', 'staff', '4686909', NULL, '2026-02-04 10:37:11', '2026-02-06 04:33:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `prn` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `branch` varchar(50) DEFAULT 'Computer Engineering',
  `division` char(1) DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `library_card_no` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reset_otp` varchar(10) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `prn`, `name`, `email`, `password`, `mobile`, `branch`, `division`, `address`, `library_card_no`, `created_at`, `updated_at`, `reset_otp`, `otp_expiry`) VALUES
(4, '202301040138', 'Satyam Gaikwad', 'satyamgaikwad.mitaoe@gmail.com', '$2y$10$O9ipvIWeODApUJc5q/RTN.Dv7vY6MWdsoYOcK2jGZvER9y2ti1wFy', '7822099563', 'Computer Engineering', 'A', '', 'MIT20230138', '2026-02-01 05:38:20', '2026-02-07 06:19:48', NULL, NULL),
(8, '202301040044', 'Sanket Umakant Banate', 'sanketbanate@gmail.com', '$2y$10$xBhxWXbI7W/BnpxzFhEGDegdHq.SWbgP9KKUqtYBL9Q5OAOOMQZAm', '4768470982', 'Computer Engineering', 'A', '', 'MIT202301040044', '2026-02-03 10:52:36', '2026-02-06 05:04:16', NULL, NULL),
(16, '202301040001', 'Amit Patil', 'sanketbanate828@gmail.com', '$2y$10$WgIgcIGayl9nRvh.0p5ttertoshBo/EwMNhFo9GgV8ALRXSyskQ/S', '900000001', 'Computer Engineering', 'A', '', 'MIT202301040001', '2026-02-07 06:27:29', '2026-02-07 06:27:29', NULL, NULL),
(18, '202301040137', 'Satyam Gaikwad', 'satyamgaikwad2787@gmail.com', '$2y$10$Ti7nsY.yvZ3LGKaiW9dM7uDCQKULMnBRx6rT0QlhNI6Ni5ZJGVkMC', '7822099563', 'Computer Engineering', 'B', '', 'MIT202301040137', '2026-02-07 06:30:31', '2026-02-07 06:30:31', NULL, NULL),
(20, '202301040004', 'Snehal Jadhav', 'sahasnagar1234@gmail.com', '$2y$10$/mzCi50bVsqjjAXvqs3ZCuupcn.twNtRxRMFbdx8a0SMWzqveWSFS', '900000004', 'Civil', 'B', '', 'MIT202301040004', '2026-02-09 03:59:13', '2026-02-09 03:59:13', NULL, NULL),
(21, '20230104005', 'Akshay Pawar', 'sahasnagar2711@gmail.com', '$2y$10$Kb64.D58iW87Cu.MAbfsR.5A461s1WNZhM6G2frTrj3YSoXSpkyN.', '900000005', 'IT', 'C', '', 'MIT20230104005', '2026-02-09 04:00:23', '2026-02-09 04:00:23', NULL, NULL),
(22, '202301040006', 'Priya Joshi', 'sahasnagar0123@gmail.com', '$2y$10$T8WwKUWF/INnGL85vjvrEu3kGp7BmarhpWNv5/xLtGm4X2z3JIwYu', '900000006', 'Mechanical', 'A', '', 'MIT202301040006', '2026-02-09 04:01:28', '2026-02-09 04:01:28', NULL, NULL),
(23, '20230040007', 'Rohan Shinde', 'sdgujar14@gmail.com', '$2y$10$N.LJSoxbT0MKAPv55XU1NOR8HMBVWnVd.FyR40BgLvCUGfMbLUHyG', '900000007', 'Civil', 'B', '', 'MIT20230040007', '2026-02-09 04:04:18', '2026-02-09 04:04:18', NULL, NULL),
(24, '202301040008', 'Neha Patil', 'sahasgujar38@gmail.com', '$2y$10$jdCDLmShdazglreuEaVezuQd/8XRJw1S/oRiFkr8eUwbaW/IPJ/xe', '900000008', 'Software', 'C', '', 'MIT202301040008', '2026-02-09 04:05:09', '2026-02-09 04:05:09', NULL, NULL),
(25, '202301040009', 'Kunal More', 'staynest06@gmail.com', '$2y$10$hLmoyqagQIJ0RsKIBIqXo.a2Xl7Fru3z9eWo.Tg8dPcR3cPYT7Ij.', '900000008', 'Mechanical', 'B', '', 'MIT202301040009', '2026-02-09 04:06:23', '2026-02-09 04:06:23', NULL, NULL),
(26, '202301040010', 'Pooja Kulkarni', 'mern.dev.elite@gmail.com', '$2y$10$OBGKfjxFgtrYf2aGphPTwOWRvXSKpLkaOZXdqHrBd.zYdrEvxLaBy', '900000010', 'Civil', 'C', '', 'MIT202301040010', '2026-02-09 04:07:03', '2026-02-09 04:07:03', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`accession_number`),
  ADD KEY `fk_book_id` (`book_id`);

--
-- Indexes for table `book_master`
--
ALTER TABLE `book_master`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_prn` (`prn`),
  ADD KEY `issued_books_ibfk_1` (`accession_number`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `config_key` (`config_key`);

--
-- Indexes for table `staff_accounts`
--
ALTER TABLE `staff_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `library_card_no` (`library_card_no`),
  ADD UNIQUE KEY `prn` (`prn`),
  ADD KEY `idx_prn_search` (`prn`),
  ADD KEY `idx_card_search` (`library_card_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `book_master`
--
ALTER TABLE `book_master`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `issued_books`
--
ALTER TABLE `issued_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff_accounts`
--
ALTER TABLE `staff_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_master` (`book_id`);

--
-- Constraints for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD CONSTRAINT `fk_student_prn` FOREIGN KEY (`prn`) REFERENCES `users` (`prn`),
  ADD CONSTRAINT `issued_books_ibfk_1` FOREIGN KEY (`accession_number`) REFERENCES `books` (`accession_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
