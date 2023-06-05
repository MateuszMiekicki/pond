CREATE TABLE IF NOT EXISTS sensor_data (
    timestamp TIMESTAMP,
    mac_address STRING,
    pin_number INT,
    value DOUBLE
) timestamp(timestamp);