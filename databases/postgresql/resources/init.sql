CREATE TABLE "role" (
    id SERIAL,
    role VARCHAR NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
INSERT INTO "role"
VALUES (1, 'admin'),
    (2, 'user');
CREATE TABLE "user" (
    id SERIAL,
    role_id SERIAL NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT role_fk FOREIGN KEY (role_id) REFERENCES "role" (id)
);
CREATE TABLE device (
    id SERIAL,
    user_id SERIAL NOT NULL,
    key VARCHAR NOT NULL UNIQUE,
    name VARCHAR,
    PRIMARY KEY (id),
    CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES "user" (id)
);
CREATE TABLE sensor (
    id SERIAL,
    device_id SERIAL NOT NULL,
    name VARCHAR,
    PRIMARY KEY (id),
    CONSTRAINT device_fk FOREIGN KEY (device_id) REFERENCES device (id)
);