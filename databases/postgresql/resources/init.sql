CREATE TABLE "user" (
    id SERIAL,
    email VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL,
    is_active BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id)
);
CREATE TABLE user_confirmation (
    id SERIAL,
    user_id SERIAL,
    confirmation_code VARCHAR,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user" (id)
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
CREATE TABLE visitor (
    id SERIAL,
    user_id SERIAL,
    device_id SERIAL,
    name VARCHAR,
    PRIMARY KEY (id),
    CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES "user" (id),
    CONSTRAINT device_fk FOREIGN KEY (device_id) REFERENCES device (id)
);
CREATE TABLE alert (
    id SERIAL,
    device_id SERIAL,
    sensor_id INTEGER,
    alert_number INTEGER NOT NULL,
    date TIMESTAMP NOT NULL,
    description VARCHAR NOT NULL,
    priority INTEGER NOT NULL,
    served BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT device_fk FOREIGN KEY (device_id) REFERENCES device (id),
    CONSTRAINT sensor_fk FOREIGN KEY (sensor_id) REFERENCES sensor (id)
);
CREATE TABLE pet (
    id SERIAL,
    name VARCHAR NOT NULL,
    description VARCHAR,
    PRIMARY KEY (id)
);
CREATE TABLE pet_habitat (
    id SERIAL,
    pet_id SERIAL,
    information JSON NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT pet_fk FOREIGN KEY (pet_id) REFERENCES pet (id)
);

--- Insert data, for testing purposes
INSERT INTO pet VALUES (1, 'Gekona lamparciego', 'Gekon lamparci, zwany też eublefarem tygrysim lub gekonem tygrysim, to gad z rzędu łuskonośnych z rodziny eublefarów. Prościej - gekon lamparci jest gatunkiem jaszczurki aktywnej wieczorem i nocą. Gekony zasiedlają naszą planetę od ponad 50 milionów lat. Żyją w lasach deszczowych, w górach i na pustyniach - te gady dostosowują się mistrzowsko do warunków atmosferycznych obszarów, które zasiedlają.');
INSERT INTO pet_habitat VALUES (1, 1, '{"temperature":{"min":"25","max":"35"},"humidity":{"min":"40","max":"50"}}');