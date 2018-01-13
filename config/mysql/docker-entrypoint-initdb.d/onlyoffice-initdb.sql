CREATE DATABASE IF NOT EXISTS onlyoffice CHARACTER SET "utf8" COLLATE "utf8_general_ci";
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET "utf8" COLLATE "utf8_general_ci";
CREATE DATABASE IF NOT EXISTS moodle CHARACTER SET "utf8mb4" COLLATE "utf8mb4_unicode_ci";

CREATE USER IF NOT EXISTS 'onlyoffice_user'@'%' IDENTIFIED BY 'onlyoffice_pass';
CREATE USER IF NOT EXISTS 'nextcloud_user'@'%' IDENTIFIED BY 'nextcloud_pass';
CREATE USER IF NOT EXISTS 'moodle_user'@'%' IDENTIFIED BY 'moodle_pass';

GRANT ALL PRIVILEGES ON onlyoffice.* TO 'onlyoffice_user'@'%';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud_user'@'%';
GRANT ALL PRIVILEGES ON moodle.* TO 'moodle_user'@'%';

FLUSH PRIVILEGES;
