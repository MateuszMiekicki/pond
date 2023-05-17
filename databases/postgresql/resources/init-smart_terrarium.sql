CREATE TABLE "role" (
    id SERIAL,
    role VARCHAR NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
INSERT INTO "role"
VALUES (1, 'owner'),
    (2, 'guest');
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

CREATE TABLE sensor_measurement_range (
    id SERIAL,
    sensor_id SERIAL NOT NULL,
    min_value NUMERIC NOT NULL,
    max_value NUMERIC NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT sensor_fk FOREIGN KEY (sensor_id) REFERENCES sensor (id)
);