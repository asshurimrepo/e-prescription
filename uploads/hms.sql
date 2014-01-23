-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 07, 2013 at 07:51 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

DROP TABLE IF EXISTS `accountant`;
CREATE TABLE IF NOT EXISTS `accountant` (
  `accountant_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `address` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `phone` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`accountant_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `address` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `phone` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(11) NOT NULL auto_increment,
  `appointment_timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY  (`appointment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
CREATE TABLE IF NOT EXISTS `bed` (
  `bed_id` int(11) NOT NULL auto_increment,
  `bed_number` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `type` longtext NOT NULL COMMENT 'ward,cabin,ICU',
  `status` int(11) NOT NULL default '0' ,
  `description` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`bed_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `bed_allotment`
--

DROP TABLE IF EXISTS `bed_allotment`;
CREATE TABLE IF NOT EXISTS `bed_allotment` (
  `bed_allotment_id` int(11) NOT NULL auto_increment,
  `bed_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allotment_timestamp` int(11) NOT NULL,
  `discharge_timestamp` int(11) NOT NULL,
  PRIMARY KEY  (`bed_allotment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

DROP TABLE IF EXISTS `blood_bank`;
CREATE TABLE IF NOT EXISTS `blood_bank` (
  `blood_group_id` int(11) NOT NULL auto_increment,
  `blood_group` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `status` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`blood_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;


--
-- Dumping data for table `blood_bank`
--

INSERT INTO `blood_bank` (`blood_group_id`, `blood_group`, `status`) VALUES
(1, 'A+', ''),
(2, 'A-', ''),
(3, 'B+', ''),
(4, 'B-', ''),
(5, 'AB+', ''),
(6, 'AB-', ''),
(7, 'O+', ''),
(8, 'O-', '');
-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

DROP TABLE IF EXISTS `blood_donor`;
CREATE TABLE IF NOT EXISTS `blood_donor` (
  `blood_donor_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `blood_group` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `sex` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `address` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `last_donation_timestamp` int(11) NOT NULL,
  PRIMARY KEY  (`blood_donor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `description` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`department_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_report`
--

DROP TABLE IF EXISTS `diagnosis_report`;
CREATE TABLE IF NOT EXISTS `diagnosis_report` (
  `diagnosis_report_id` int(11) NOT NULL auto_increment,
  `report_type` longtext collate utf8_unicode_ci NOT NULL COMMENT 'xray,blood test',
  `document_type` longtext collate utf8_unicode_ci NOT NULL COMMENT 'text,photo',
  `file_name` longtext collate utf8_unicode_ci NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `description` longtext collate utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `laboratorist_id` int(11) NOT NULL,
  PRIMARY KEY  (`diagnosis_report_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctor_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `address` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `phone` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `profile` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`doctor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE IF NOT EXISTS `email_template` (
  `email_template_id` int(11) NOT NULL auto_increment,
  `task` longtext character set latin1 NOT NULL,
  `subject` longtext character set latin1 NOT NULL,
  `body` longtext character set latin1 NOT NULL,
  PRIMARY KEY  (`email_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL auto_increment,
  `patient_id` int(11) NOT NULL,
  `title` longtext collate utf8_unicode_ci NOT NULL,
  `description` longtext collate utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `status` longtext collate utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  PRIMARY KEY  (`invoice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `laboratorist`
--

DROP TABLE IF EXISTS `laboratorist`;
CREATE TABLE IF NOT EXISTS `laboratorist` (
  `laboratorist_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `address` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `phone` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`laboratorist_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `phrase_id` int(11) NOT NULL auto_increment,
  `phrase` longtext collate utf8_unicode_ci NOT NULL,
  `english` longtext collate utf8_unicode_ci NOT NULL,
  `bengali` longtext collate utf8_unicode_ci NOT NULL,
  `spanish` longtext collate utf8_unicode_ci NOT NULL,
  `arabic` longtext collate utf8_unicode_ci NOT NULL,
  `dutch` longtext collate utf8_unicode_ci NOT NULL,
  `russian` longtext collate utf8_unicode_ci NOT NULL,
  `chinese` longtext collate utf8_unicode_ci NOT NULL,
  `turkish` longtext collate utf8_unicode_ci NOT NULL,
  `portuguese` longtext collate utf8_unicode_ci NOT NULL,
  `hungarian` longtext collate utf8_unicode_ci NOT NULL,
  `french` longtext collate utf8_unicode_ci NOT NULL,
  `greek` longtext collate utf8_unicode_ci NOT NULL,
  `german` longtext collate utf8_unicode_ci NOT NULL,
  `italian` longtext collate utf8_unicode_ci NOT NULL,
  `thai` longtext collate utf8_unicode_ci NOT NULL,
  `urdu` longtext collate utf8_unicode_ci NOT NULL,
  `hindi` longtext collate utf8_unicode_ci NOT NULL,
  `latin` longtext collate utf8_unicode_ci NOT NULL,
  `indonesian` longtext collate utf8_unicode_ci NOT NULL,
  `japanese` longtext collate utf8_unicode_ci NOT NULL,
  `korean` longtext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`phrase_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=234 ;

--
-- Dumping data for table `language`
--


-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(11) NOT NULL auto_increment,
  `type` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `ip` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `location` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `medicine_id` int(11) NOT NULL auto_increment,
  `name` longtext collate utf8_unicode_ci NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `description` longtext collate utf8_unicode_ci NOT NULL,
  `price` longtext collate utf8_unicode_ci NOT NULL,
  `manufacturing_company` longtext collate utf8_unicode_ci NOT NULL,
  `status` longtext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`medicine_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

DROP TABLE IF EXISTS `medicine_category`;
CREATE TABLE IF NOT EXISTS `medicine_category` (
  `medicine_category_id` int(11) NOT NULL auto_increment,
  `name` longtext collate utf8_unicode_ci NOT NULL,
  `description` longtext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`medicine_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL,
  `message` longtext collate utf8_unicode_ci NOT NULL,
  `user_from_type` longtext collate utf8_unicode_ci NOT NULL,
  `user_from_id` int(11) NOT NULL,
  `user_to_type` longtext collate utf8_unicode_ci NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `timestamp` longtext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
CREATE TABLE IF NOT EXISTS `noticeboard` (
  `notice_id` int(11) NOT NULL auto_increment,
  `notice_title` longtext collate utf8_unicode_ci NOT NULL,
  `notice` longtext collate utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL,
  PRIMARY KEY  (`notice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
CREATE TABLE IF NOT EXISTS `nurse` (
  `nurse_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `address` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `phone` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`nurse_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(11) NOT NULL auto_increment,
  `name` longtext collate utf8_unicode_ci NOT NULL,
  `email` longtext collate utf8_unicode_ci NOT NULL,
  `password` longtext collate utf8_unicode_ci NOT NULL,
  `address` longtext collate utf8_unicode_ci NOT NULL,
  `phone` longtext collate utf8_unicode_ci NOT NULL,
  `sex` longtext collate utf8_unicode_ci NOT NULL,
  `birth_date` longtext collate utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` longtext collate utf8_unicode_ci NOT NULL,
  `account_opening_timestamp` int(11) NOT NULL,
  PRIMARY KEY  (`patient_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL auto_increment,
  `payment_type` longtext collate utf8_unicode_ci NOT NULL,
  `transaction_id` longtext collate utf8_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `method` longtext collate utf8_unicode_ci NOT NULL,
  `description` longtext collate utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY  (`payment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
CREATE TABLE IF NOT EXISTS `pharmacist` (
  `pharmacist_id` int(11) NOT NULL auto_increment,
  `name` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `address` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `phone` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`pharmacist_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `prescription_id` int(11) NOT NULL auto_increment,
  `creation_timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `case_history` longtext collate utf8_unicode_ci NOT NULL,
  `medication` longtext collate utf8_unicode_ci NOT NULL,
  `medication_from_pharmacist` longtext collate utf8_unicode_ci NOT NULL,
  `description` longtext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`prescription_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(11) NOT NULL auto_increment,
  `type` longtext collate utf8_unicode_ci NOT NULL COMMENT 'operation,birth,death',
  `description` longtext collate utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `settings_id` int(11) NOT NULL auto_increment,
  `type` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `description` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`settings_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', ''),
(7, 'system_email', ''),
(2, 'system_title', ''),
(3, 'address', ''),
(4, 'phone', ''),
(5, 'paypal_email', ''),
(6, 'currency', '');