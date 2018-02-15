SELECT Track.Name, PlaylistTrack.TrackId FROM 
Track JOIN PlaylistTrack
ON Track.TrackId = PlaylistTrack.TrackId
Where PlaylistTrack.playlistId = 5

SELECT Track.Name, Playlist.Name FROM
Track JOIN PlaylistTrack JOIN Playlist
ON Track.TrackId = PlaylistTrack.TrackId AND 
PlaylistTrack.PlaylistId = Playlist.PlaylistId

SELECT Track.Name, Album.Title FROM
Track JOIN Album JOIN Genre
On Track.AlbumId = Album.AlbumId AND
Genre.GenreId = Track.GenreId
WHERE Genre.GenreId = 23

SELECT * FROM Invoice
WHERE InvoiceId in (SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice > 0.99);

SELECT * FROM PlaylistTrack
WHERE PlaylistId in (SELECT PlaylistId FROM Playlist WHERE Name = 'Music');

SELECT Name From Track
WHERE TrackId in (SELECT TrackId FROM PlaylistTrack WHERE PlaylistId = 5)

SELECT * FROM Track
WHERE GenreId in (SELECT GenreId FROM Genre WHERE Name = 'Comedy' )

SELECT * FROM Track
WHERE AlbumId In (SELECT AlbumId FROM Album WHERE Title='Fireball')

SELECT * FROM Track
WHERE AlbumId in (SELECT AlbumId FROM Album WHERE ArtistId in (SELECT ArtistId FROM Artist WHERE Name = 'Queen'))

UPDATE Customer
SET Fax = Null

UPDATE Customer
SET Company = 'Self'
WHERE Company is NULL;

UPDATE Customer
SET LastName = 'Thompson'
WHERE FirstName = 'Julia'

UPDATE Customer
SET SupportRepId = 4
WHERE Email = 'luisrojas@yahoo.cl';

UPDATE Track
SET Composer = 'The darkness around us'
WHERE GenreId in (SELECT GenreId FROM Genre WHERE Name = 'Metal') 
AND Composer is null;

SELECT count(*), Genre.Name FROM Track
JOIN Genre
ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name

SELECT Count(*), Genre.Name FROM
Track 
JOIN Genre ON Genre.GenreId = Track.GenreId 
WHERE Genre.Name = "Pop" OR Genre.Name = "Rock"
GROUP BY Genre.Name

SELECT Artist.Name, Count(*) FROM
Album JOIN Artist
WHERE Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name

SELECT DISTINCT Composer 
FROM Track

SELECT DISTINCT billingpostalcode
FROM Invoice

DELETE FROM practice_delete
WHERE type = 'bronze';

DELETE FROM practice_delete
WHERE value = 150;

DROP TABLE IF EXISTS Users;
 CREATE TABLE Users
 (
 Name TEXT
 , Email TEXT PRIMARY KEY
 );
 
 CREATE TABLE Products
 (
 Name TEXT PRIMARY KEY
 , Price INTEGER 
 );
 
 CREATE TABLE Orders
 (
 OrderNo INTEGER SERIAL PRIMARY KEY
 , Product TEXT REFERENCES Products(Name)
 );
 
 INSERT INTO Users (Name, Email) VALUES ('Josh', 'JOSH@COOL');
 INSERT INTO Users (Name, Email) VALUES ('Annie', 'ANNIE@COOL');
 INSERT INTO Users (Name, Email) VALUES ('Peach', 'EMMIE@COOL');
 
 INSERT INTO Products (Name, Price) VALUES ('AAA', '23.34');
 INSERT INTO Products (Name, Price) VALUES ('BBB', '26.67');
 INSERT INTO Products (Name, Price) VALUES ('CCC', '22.45');
 
 INSERT INTO Orders (Product) VALUES ('AAA');
 INSERT INTO Orders (Product) VALUES ('BBB');
 INSERT INTO Orders (Product) VALUES ('CCC');
 
 SELECT * FROM Users;
 SELECT * FROM Products;
 SELECT * FROM Orders;

SELECT SUM(price) FROM
Products pr JOIN Orders Ors
ON pr.Name = Ors.product
WHERE Ors.Product = 'AAA'

ALTER TABLE Orders
ADD Email REFERENCES Users(Email);

UPDATE Orders
SET Name = 'EMMIE@COOL'
WHERE Product = 'CCC';

SELECT * FROM Orders;

SELECT * FROM Orders
WHERE Name = 'JOSH@COOL'

SELECT Count(*), Name FROM Orders
GROUP BY Name