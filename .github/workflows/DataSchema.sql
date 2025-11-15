CREATE TABLE users (

    id                NUMBER NOT NULL PRIMARY KEY,

    username_name     VARCHAR(50) NOT NULL UNIQUE,

    CONSTRAINT check_username_format CHECK (username_name REGEXP '^[a-zA-Z0-9]{3,}$')

);



CREATE TABLE profiles (

    id                NUMBER NOT NULL PRIMARY KEY,

    user_id           NUMBER NOT NULL UNIQUE REFERENCES users(id), 

    interest_name     VARCHAR(100) NOT NULL,

    region_name       VARCHAR(50) NOT NULL

);



CREATE TABLE contests (

    id                NUMBER NOT NULL PRIMARY KEY,

    name_name         VARCHAR(255) NOT NULL UNIQUE,

    deadline_date     TIMESTAMP NOT NULL,

    status_status     VARCHAR(50) NOT NULL, 

    CONSTRAINT check_status CHECK (status_status IN ('Відкрита реєстрація', 'Очікується', 'Архів')),

    CONSTRAINT check_contest_name CHECK (name_name REGEXP '^[А-ЯA-Z].*\s.*$')

);



CREATE TABLE materials (

    id                NUMBER NOT NULL PRIMARY KEY,

    user_id           NUMBER NOT NULL REFERENCES users(id), 

    name_name         VARCHAR(100) NOT NULL,

    type_name         VARCHAR(50) NOT NULL

);



CREATE TABLE instructions (

    id                NUMBER NOT NULL PRIMARY KEY,

    material_id       NUMBER NOT NULL UNIQUE REFERENCES materials(id), 

    content_text      VARCHAR(2000) NOT NULL,

    adaptation_status VARCHAR(50) NOT NULL

);



CREATE TABLE profile_contests (

    profile_id        NUMBER NOT NULL REFERENCES profiles(id),

    contest_id        NUMBER NOT NULL REFERENCES contests(id),

    tracked_date      TIMESTAMP NOT NULL,

    PRIMARY KEY (profile_id, contest_id)

);
