CREATE TABLE IF NOT EXISTS sensor_data (
    id TIMESTAMP,
    device_id UUID,
    sensor_id UUID,
    value DOUBLE
);