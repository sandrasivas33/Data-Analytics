CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    banned VARCHAR(3),
    ROLE VARCHAR(10) 
);

INSERT INTO Users (user_id, banned, ROLE) VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

CREATE TABLE Trips (
    id SERIAL PRIMARY KEY,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(50),
    request_at DATE,
    FOREIGN KEY (client_id) REFERENCES Users(user_id),
    FOREIGN KEY (driver_id) REFERENCES Users(user_id)
);

INSERT INTO Trips (client_id, driver_id, city_id, status, request_at) VALUES
(1, 10, 1, 'completed', '2023-07-12'),
(2, 11, 1, 'cancelled_by_driver', '2023-07-12'),
(3, 12, 6, 'completed', '2023-07-12'),
(4, 13, 6, 'cancelled_by_client', '2023-07-12'),
(1, 10, 1, 'completed', '2023-07-13'),
(2, 11, 6, 'completed', '2023-07-13'),
(3, 12, 6, 'completed', '2023-07-13'),
(2, 12, 12, 'completed', '2023-07-14'),
(3, 10, 12, 'completed', '2023-07-14'),
(4, 13, 12, 'cancelled_by_driver', '2023-07-14');

SELECT 
    request_at AS DAY, 
    ROUND(
        CAST(SUM(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) AS NUMERIC) / 
        NULLIF(COUNT(*), 0), 
    2) AS cancellation_rate
FROM Trips 
WHERE client_id IN (SELECT user_id FROM Users WHERE banned = 'No') 
GROUP BY request_at
ORDER BY request_at;