CREATE TABLE "user" (
    id SERIAL,
    email VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE device (
    id SERIAL,
    user_id SERIAL,
    mac_address VARCHAR NOT NULL UNIQUE,
    name VARCHAR,
    PRIMARY KEY (id),
    CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES "user" (id)
);
CREATE TABLE sensor (
    id SERIAL,
    device_id SERIAL,
    pin_number INTEGER NOT NULL,
    name VARCHAR,
    type VARCHAR NOT NULL,
    min_value NUMERIC NOT NULL,
    max_value NUMERIC NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT device_fk FOREIGN KEY (device_id) REFERENCES device (id),
    CONSTRAINT constraint_device_pin_number UNIQUE (device_id, pin_number)
);