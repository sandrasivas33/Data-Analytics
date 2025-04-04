
CREATE TABLE Emails (
    id INT PRIMARY KEY,
    NAME VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

INSERT INTO Emails (id, NAME, email, phone) VALUES
(1, 'Rahul', 'rahul@example.com', '9839473902'),
(2, 'Rohit', 'rohit@example.com', '9883782971'),
(3, 'Suresh', 'rahul@example.com', '7654321098'),
(4, 'Manish', 'manish@example.com', '8927394619'),
(5, 'Amit', 'amit@example.com', '9399303840'),
(6, 'Rahul', 'rahul@example.com', '9737466147');

SELECT * FROM public.emails

WITH CTE AS (
    SELECT id, email, 
           ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM Emails
)
DELETE FROM Emails WHERE id IN (SELECT id FROM CTE WHERE rn > 1);

SELECT * FROM public.emails