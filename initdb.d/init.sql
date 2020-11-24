CREATE DATABASE IF NOT EXISTS `luckperms`;
CREATE DATABASE IF NOT EXISTS `advancedban`;

CREATE USER IF NOT EXISTS `luckperms`@`%` IDENTIFIED BY 'luckperms';
CREATE USER IF NOT EXISTS `advancedban`@`%` IDENTIFIED BY 'advancedban';

GRANT ALL PRIVILEGES ON `luckperms`.* TO `luckperms`@`%`;
GRANT ALL PRIVILEGES ON `advancedban`.* TO `advancedban`@`%`;
