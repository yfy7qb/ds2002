Part 1

Question 1
SELECT name from country where Region = "South America";

Question 2
SELECT population from country where Name = "Germany";

Question 3
SELECT name from city where countrycode = "JPN";

Question 4
SELECT city.Name, country.Continent, city.Population
FROM city
Join country On city.CountryCode = country.Code
WHERE city.Population IN (
	SELECT Population FROM city WHERE country.Continent = "Africa")
ORDER by Population DESC
LIMIT 3;

Question 5
SELECT name, lifeexpectancy
FROM country
WHERE Population > 1000000 AND Population < 5000000;

Question 6
SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

Question 7
SELECT Album.Title FROM Album
JOIN Artist on Artist.ArtistId = Album.ArtistId
WHERE Artist.Name = "AC/DC";

Question 8
SELECT FirstName, LastName, Email FROM Customer WHERE Country = "Brazil";

Question 9
SELECT Name from Playlist;

Question 10
SELECT Track.Name from Track
JOIN Genre on Genre.GenreId = Track.GenreID
WHERE Genre.Name = "Rock";

Question 11
SELECT FirstName, LastName FROM Employee
WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');

Question 12
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total)
FROM Invoice
JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY SUM(Invoice.Total) DESC;




Part 2

Creating Tables:

CREATE TABLE CreamCheeseTypes (
    Cost REAL,
    Name VARCHAR(30),
    NameID CHAR(3),
    PRIMARY KEY (NameID)
    );
    
CREATE TABLE BagelTypes (
    Cost REAL,
    Name VARCHAR(30),
    NameID CHAR(3),
    PRIMARY KEY (NameID)
    );
    
CREATE TABLE BagelOrders (
    Bagel CHAR(3),
    CreamCheese CHAR (3),
    FirstName VARCHAR (30),
    LastName VARCHAR (30),
    OrderNumber INT,
    PRIMARY KEY (OrderNumber),
    FOREIGN KEY (CreamCheese) REFERENCES CreamCheeseTypes(NameID),
    FOREIGN KEY (Bagel) REFERENCES BagelTypes(NameID)
    );

Inserting Rows:

INSERT INTO BagelTypes
VALUES (1.05, "Plain", "PLN");

INSERT INTO BagelTypes
VALUES (1.05, "Sesame", "SSM");

INSERT INTO BagelTypes
VALUES (1.05, "Everything", "EVR");

INSERT INTO BagelTypes
VALUES (1.05, "Cinnamon Raisin", "CNR");

INSERT INTO BagelTypes
VALUES (1.05, "Salt", "SLT");

INSERT INTO CreamCheeseTypes
VALUES (2.40, "Plain", "PLN");

INSERT INTO CreamCheeseTypes
VALUES (2.85, "Strawberry", "STR");

INSERT INTO CreamCheeseTypes
VALUES (2.30, "Peanut Butter", "PBR");

INSERT INTO CreamCheeseTypes
VALUES (2.85, "Jalapeno Lime", "JLL");

INSERT INTO CreamCheeseTypes
VALUES (2.25, "Cinnamon Sugar and Butter", "CSB");

INSERT INTO BagelOrders
VALUES ("PLN", "PLN", "Alexander", "Church", 1);

INSERT INTO BagelOrders
VALUES ("SSM", "STR", "Jim", "Ryan", 2);

INSERT INTO BagelOrders
VALUES ("EVR", "PBR", "Tony", "Elliot", 3);

INSERT INTO BagelOrders
VALUES ("CNR", "CSB", "Tony", "Bennett", 4);

INSERT INTO BagelOrders
VALUES ("SLT", "PBR", "Ralph", "Sampson", 5);


Write Queries:

SELECT CreamCheese, Bagel from BagelOrders where FirstName = "Tony";

SELECT CreamCheese FROM BagelOrders
JOIN CreamCheeseTypes on CreamCheeseTypes.NameID = BagelOrders.CreamCheese
WHERE CreamCheeseTypes.Cost > 2.50;

SELECT FirstName, LastName FROM BagelOrders
JOIN CreamCheeseTypes on CreamCheeseTypes.NameID = BagelOrders.CreamCheese
WHERE CreamCheeseTypes.Name = "Peanut Butter";
