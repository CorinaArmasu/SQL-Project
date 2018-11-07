/*  Query 1 - query used for first insight-
1.Which is the amount spent by top 5 artists*/

SELECT Artist.Name, round(sum(InvoiceLine.Quantity * InvoiceLine.UnitPrice),0) as AmountSpent
FROM Artist
JOIN Album
ON Artist.ArtistId = Album.ArtistId
JOIN Track
ON Album.AlbumId=Track.AlbumId
JOIN InvoiceLine
ON Track.TrackId=InvoiceLine.TrackId
GROUP BY Artist.Name
ORDER BY AmountSpent DESC
LIMIT 5;

/* Query 2 - query used for second insight-
2.Who is writing rock music by Number of Songs?*/
SELECT Artist.ArtistId, Artist.Name, count(Artist.ArtistId) as Songs
FROM Artist
JOIN Album
ON Artist.ArtistId = Album.ArtistId
JOIN Track
ON Album.AlbumId=Track.AlbumId
JOIN Genre
ON Track.GenreId=Genre.GenreId
WHERE Genre.Name = 'Rock'
GROUP BY Artist.Name
ORDER BY Songs DESC
LIMIT 10;

/*Query 3 - query used for third insight-
3.Which is the average number of invoices by BillingCountry?*/
SELECT BillingCountry, round(AVG(Invoiceid),0) as Invoices
From Invoice
JOIN Customer
ON Invoice.CustomerId=Customer.CustomerId
GROUP BY BillingCountry
ORDER BY Invoices DESC
Limit 7;

/*Query 4 - query used for fourth insight-
4.Which is the UnitPrice per Track?*/
SELECT UnitPrice, count(TrackId) as Number
From Track
JOIN Album
ON Track.AlbumId=Album.AlbumId
GROUP BY UnitPrice
ORDER BY Number ASC;
