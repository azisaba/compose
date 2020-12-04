CREATE DATABASE `luckperms`;
CREATE DATABASE `advancedban`;

CREATE DATABASE `event_points`;
CREATE DATABASE `lgwf_points`;
CREATE DATABASE `player_points`;
CREATE DATABASE `token_manager`;
CREATE DATABASE `tokens`;

CREATE USER `luckperms`@`%` IDENTIFIED BY 'luckperms';
CREATE USER `advancedban`@`%` IDENTIFIED BY 'advancedban';

CREATE USER `event_points`@`%` IDENTIFIED BY 'event_points';
CREATE USER `lgwf_points`@`%` IDENTIFIED BY 'lgwf_points';
CREATE USER `player_points`@`%` IDENTIFIED BY 'player_points';
CREATE USER `token_manager`@`%` IDENTIFIED BY 'token_manager';
CREATE USER `tokens`@`%` IDENTIFIED BY 'tokens';

GRANT ALL PRIVILEGES ON `luckperms`.* TO `luckperms`@`%`;
GRANT ALL PRIVILEGES ON `advancedban`.* TO `advancedban`@`%`;

GRANT ALL PRIVILEGES ON `event_points`.* TO `event_points`@`%`;
GRANT ALL PRIVILEGES ON `lgwf_points`.* TO `lgwf_points`@`%`;
GRANT ALL PRIVILEGES ON `player_points`.* TO `player_points`@`%`;
GRANT ALL PRIVILEGES ON `token_manager`.* TO `token_manager`@`%`;
GRANT ALL PRIVILEGES ON `tokens`.* TO `tokens`@`%`;
