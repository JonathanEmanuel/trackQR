CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE qrs (
    qr_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    destination_url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    INDEX (user_id)
);


CREATE TABLE visits (
    visit_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    qr_id INT NOT NULL,
    visited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    ip_address VARCHAR(45) NULL,
    user_agent VARCHAR(255) NULL,
    referer VARCHAR(255) NULL,
    language VARCHAR(20) NULL,

    device_type VARCHAR(20) NULL,       -- mobile | tablet | desktop
    operating_system VARCHAR(40) NULL,  -- android | ios | windows | mac | linux

    screen_width INT NULL,
    screen_height INT NULL,
    timezone_offset INT NULL,
    session_id VARCHAR(128) NULL,

    FOREIGN KEY (qr_id)
        REFERENCES qrs(qr_id)
        ON DELETE CASCADE,

    INDEX (qr_id),
    INDEX (visited_at)
);


CREATE TABLE login_logs (
    login_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45) NULL,
    user_agent VARCHAR(255) NULL,
    success TINYINT(1) NOT NULL,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    INDEX (user_id),
    INDEX (logged_at),
    INDEX (user_id, success)
);
