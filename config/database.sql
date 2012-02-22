CREATE USER 'webapp_user'@'localhost' IDENTIFIED BY 'webapp_pass';
GRANT ALL PRIVILEGES ON webapp_wohnungs.* TO 'webapp_user'@'localhost';
