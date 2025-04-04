CREATE TABLE Ads (
    adId INT PRIMARY KEY,
    VIEWS INT,
    Clicks INT,
    COST DECIMAL(10,2)
);
INSERT INTO Ads (adId, VIEWS, Clicks, COST) VALUES
(1, 1000, 50, 20.5),
(2, 800, 30, 15.2),
(3, 1200, 80, 25.7),
(4, 600, 20, 10.9),
(5, 1500, 120, 40.3);

SELECT * FROM public.ads

SELECT adId, 
       CONCAT(ROUND((Clicks * 100.0 / VIEWS), 1), '%') AS CTR, 
       VIEWS, 
       Clicks, 
       COST
FROM Ads
ORDER BY (Clicks * 100.0 / VIEWS) DESC;