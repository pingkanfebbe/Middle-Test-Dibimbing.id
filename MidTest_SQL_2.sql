CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought;

SELECT item
FROM (SELECT item, COUNT(item) AS items
      FROM item_bought
      GROUP BY item) AS counts_items
      
WHERE items != (SELECT MAX(items)
                     FROM (SELECT COUNT(item) AS items
                           FROM item_bought
                           GROUP BY item) AS items_max)
AND items != (SELECT MIN(items) 
                   FROM (SELECT COUNT(item) AS items
                         FROM item_bought
                         GROUP BY item) AS items_min);