-- Create TableSpesification Table
CREATE TABLE TableSpesification (
    TableId CHAR(6) NOT NULL PRIMARY KEY,
    TableNumber INT,
    ChairNumber INT,
    TablePic VARCHAR(75) NOT NULL,
    TableType VARCHAR(50)
);

-- Insert data into TableSpesification
INSERT INTO TableSpesification (TableId, TableNumber, ChairNumber, TablePic, TableType) VALUES
('T00001', 1, 4, 'table1.jpg', 'Round'),
('T00002', 2, 6, 'table2.jpg', 'Square'),
('T00003', 3, 2, 'table3.jpg', 'Rectangle'),
('T00004', 4, 4, 'table4.jpg', 'Oval'),
('T00005', 5, 8, 'table5.jpg', 'High-top'),
('T00006', 6, 2, 'table6.jpg', 'Low'),
('T00007', 7, 4, 'table7.jpg', 'Picnic'),
('T00008', 8, 6, 'table8.jpg', 'Café'),
('T00009', 9, 4, 'table9.jpg', 'Bar'),
('T00010', 10, 10, 'table10.jpg', 'Family');


-- Create TableOrder Table
CREATE TABLE TableOrder (
    TableOrderId CHAR(6) NOT NULL PRIMARY KEY,
    TableId CHAR(6) NOT NULL,
    MenuName VARCHAR(75) NOT NULL,
    QuantityOrder INT,
    FOREIGN KEY (TableId) REFERENCES TableSpesification(TableId)
);

-- Insert data into TableOrder
INSERT INTO TableOrder (TableOrderId, TableId, MenuName, QuantityOrder) VALUES
('O00001', 'T00001', 'Pizza', 2),
('O00002', 'T00002', 'Pasta', 1),
('O00003', 'T00003', 'Salad', 3),
('O00004', 'T00004', 'Burger', 4),
('O00005', 'T00005', 'Soda', 5),
('O00006', 'T00006', 'Coffee', 2),
('O00007', 'T00007', 'Tea', 1),
('O00008', 'T00008', 'Dessert', 6),
('O00009', 'T00009', 'Fries', 3),
('O00010', 'T00010', 'Ice Cream', 2);


-- Create TableOrderDetails Table
CREATE TABLE TableOrderDetails (
    OrderDetailsId CHAR(6) NOT NULL PRIMARY KEY,
    TableId CHAR(6) NOT NULL,
    TableOrderId CHAR(6) NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (TableId) REFERENCES TableSpesification(TableId),
    FOREIGN KEY (TableOrderId) REFERENCES TableOrder(TableOrderId)
);

-- Insert data into TableOrderDetails
INSERT INTO TableOrderDetails (OrderDetailsId, TableId, TableOrderId, OrderDate, TotalAmount) VALUES
('D00001', 'T00001', 'O00001', '2024-08-21 12:30:00', 25.50),
('D00002', 'T00002', 'O00002', '2024-08-21 13:00:00', 15.00),
('D00003', 'T00003', 'O00003', '2024-08-21 13:15:00', 30.75),
('D00004', 'T00004', 'O00004', '2024-08-21 14:00:00', 45.00),
('D00005', 'T00005', 'O00005', '2024-08-21 14:30:00', 22.50),
('D00006', 'T00006', 'O00006', '2024-08-21 15:00:00', 18.00),
('D00007', 'T00007', 'O00007', '2024-08-21 15:30:00', 12.00),
('D00008', 'T00008', 'O00008', '2024-08-21 16:00:00', 50.00),
('D00009', 'T00009', 'O00009', '2024-08-21 16:30:00', 27.25),
('D00010', 'T00010', 'O00010', '2024-08-21 17:00:00', 33.60);



-- Create TableOrderHistory Table
CREATE TABLE TableOrderHistory (
    HistoryId CHAR(6) NOT NULL PRIMARY KEY,
    TableId CHAR(6) NOT NULL,
    TableOrderId CHAR(6) NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (TableId) REFERENCES TableSpesification(TableId),
    FOREIGN KEY (TableOrderId) REFERENCES TableOrder(TableOrderId)
);

-- Insert data into TableOrderHistory
INSERT INTO TableOrderHistory (HistoryId, TableId, TableOrderId, OrderDate, TotalAmount) VALUES
('H00001', 'T00001', 'O00001', '2024-08-21 12:30:00', 25.50),
('H00002', 'T00001', 'O00002', '2024-08-21 13:00:00', 15.00),
('H00003', 'T00002', 'O00003', '2024-08-21 13:15:00', 30.75),
('H00004', 'T00003', 'O00004', '2024-08-21 14:00:00', 45.00),
('H00005', 'T00004', 'O00005', '2024-08-21 14:30:00', 22.50),
('H00006', 'T00005', 'O00006', '2024-08-21 15:00:00', 18.00),
('H00007', 'T00006', 'O00007', '2024-08-21 15:30:00', 12.00),
('H00008', 'T00007', 'O00008', '2024-08-21 16:00:00', 50.00),
('H00009', 'T00008', 'O00009', '2024-08-21 16:30:00', 27.25),
('H00010', 'T00009', 'O00010', '2024-08-21 17:00:00', 33.60);

-- Create OrderHistoryDetail Table for Many-to-Many Relationship
CREATE TABLE OrderHistoryDetail (
    HistoryDetailId CHAR(6) NOT NULL PRIMARY KEY,
    HistoryId CHAR(6) NOT NULL,
    TableOrderId CHAR(6) NOT NULL,
    FOREIGN KEY (HistoryId) REFERENCES TableOrderHistory(HistoryId),
    FOREIGN KEY (TableOrderId) REFERENCES TableOrder(TableOrderId)
);

-- Insert data into OrderHistoryDetail
INSERT INTO OrderHistoryDetail (HistoryDetailId, HistoryId, TableOrderId) VALUES
('D001', 'H00001', 'O00001'),
('D002', 'H00001', 'O00002'),
('D003', 'H00002', 'O00003'),
('D004', 'H00003', 'O00004'),
('D005', 'H00003', 'O00005');

