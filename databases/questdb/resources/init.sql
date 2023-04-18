CREATE TABLE IF NOT EXISTS sensor_data (
    timestamp TIMESTAMP,
    device_id INT,
    sensor_id INT,
    value DOUBLE
) timestamp(timestamp);