CREATE USER 'report_user'@'localhost' IDENTIFIED BY '12345';

GRANT SELECT ON sakila.* TO 'report_user'@'localhost';

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON world.* TO 'admin_user'@'localhost';

CREATE USER 'dev_user'@'localhost' IDENTIFIED BY '12345';

GRANT SELECT, INSERT, UPDATE ON sakila.actor TO 'dev_user'@'localhost';

SHOW GRANTS FOR 'dev_user'@'localhost';

CREATE USER 'guest_user'@'localhost' IDENTIFIED BY '12345';

GRANT SELECT ON world.city TO 'report_user'@'localhost';

REVOKE SELECT ON sakila.* FROM 'report_user'@'localhost';

REVOKE ALL PRIVILEGES ON sakila.actor FROM 'dev_user'@'localhost';

DROP USER 'report_user'@'localhost';
DROP USER 'admin_user'@'localhost';
DROP USER 'dev_user'@'localhost';
DROP USER 'guest_user'@'localhost';
