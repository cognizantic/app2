DROP DATABASE app1;
set global event_scheduler=on;
CREATE DATABASE app1;
USE app1;

CREATE TABLE profile_(
    user_id VARCHAR(255) PRIMARY KEY DEFAULT(UUID()),
    username VARCHAR(40) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT,
    dob DATE,
    ph_no VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    state TEXT NOT NULL,
    country TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    banned_until TIMESTAMP
);
CREATE TABLE verification_(
    user_id VARCHAR(255) PRIMARY KEY,
    hash_pass VARCHAR(255),
    change_token VARCHAR(6),
    identity_confirmation BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    confirmed_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES profile_(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE authen(
    user_id VARCHAR(255) PRIMARY KEY,
    hash_pass VARCHAR(255) NOT NULL DEFAULT ('hello'),
    session_duration TIME,
    token_id VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    refreshed_at TIMESTAMP,
    close_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES profile_(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE devices_wifi(
    device_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(255) NOT NULL,
    username varchar(45) not null,
    device_name VARCHAR(255) NOT NULL,
    usage_time double not null default(0.0),
    data_transfer double not null default(0.0),
    ip_addr_v4 VARCHAR(45) DEFAULT('0.0.0.0'),
    ip_addr_v6 VARCHAR(45) DEFAULT('::'),
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_update boolean not null default(false),
    port_no INT NOT NULL CHECK(port_no BETWEEN 1 AND 65535) default(443),
    FOREIGN KEY (user_id) REFERENCES profile_(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);


DELIMITER $$

CREATE FUNCTION generate_unique_token()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
    DECLARE candidate VARCHAR(6);
    DECLARE exists_count INT DEFAULT 1;

    WHILE exists_count > 0 DO
        SET candidate = LPAD(
            CONV(SUBSTRING(REPLACE(UUID(), '-', ''), 1, 5), 16, 10) % 1000000,
            6,
            '0'
        );
        SELECT COUNT(*) INTO exists_count
        FROM verification_
        WHERE change_token = candidate;
    END WHILE;
    RETURN candidate;
END $$

CREATE TRIGGER gen_new_change_code_insert
AFTER INSERT ON profile_
FOR EACH ROW
BEGIN
    DECLARE token VARCHAR(6);
    REPEAT
        SET token = generate_unique_token();
    UNTIL NOT EXISTS (
        SELECT 1 FROM verification_ WHERE change_token = token
    )
    END REPEAT;

    INSERT INTO verification_ (user_id, change_token)
    VALUES (NEW.user_id, token);
END $$

CREATE TRIGGER gen_new_change_code_update
AFTER UPDATE ON profile_
FOR EACH ROW
BEGIN
    DECLARE token VARCHAR(6);
    REPEAT
        SET token = generate_unique_token();
    UNTIL NOT EXISTS (
        SELECT 1 FROM verification_ WHERE change_token = token
    )
    END REPEAT;
    INSERT INTO verification_ (user_id, change_token)
    VALUES (NEW.user_id, token);
END $$

create event if not exists ip_clean
on schedule every 1 minute
do
begin
	update devices_wifi set status_update =false where timestampdiff(minute,last_update,now())>=2;
end $$


DELIMITER ;

