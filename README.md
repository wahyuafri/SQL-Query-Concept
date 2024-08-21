# SQL-Query-Concept
This repository are made for learning

# Database Schema and Data

## Tables and Relationships

### `TableSpesification`
- **TableId**: Unique identifier for the table (e.g., `T00001`).
- **TableNumber**: The number of the table.
- **ChairNumber**: The number of chairs at the table.
- **TablePic**: File name for the table picture.
- **TableType**: The type of the table (e.g., Round, Square).

### `TableOrder`
- **TableOrderId**: Unique identifier for the order (e.g., `O00001`).
- **TableId**: Foreign key linking to `TableSpesification`.
- **MenuName**: Name of the menu item ordered.
- **QuantityOrder**: Quantity of the menu item ordered.

### `TableOrderDetails`
- **OrderDetailsId**: Unique identifier for the order details (e.g., `D00001`).
- **TableId**: Foreign key linking to `TableSpesification`.
- **TableOrderId**: Foreign key linking to `TableOrder`.
- **OrderDate**: Date and time of the order.
- **TotalAmount**: Total amount for the order.

### `TableOrderHistory`
- **HistoryId**: Unique identifier for the order history (e.g., `H00001`).
- **TableId**: Foreign key linking to `TableSpesification`.
- **TableOrderId**: Foreign key linking to `TableOrder`.
- **OrderDate**: Date and time of the order history.
- **TotalAmount**: Total amount for the order history.

### `OrderHistoryDetail`
- **HistoryDetailId**: Unique identifier for the order history detail (e.g., `D001`).
- **HistoryId**: Foreign key linking to `TableOrderHistory`.
- **TableOrderId**: Foreign key linking to `TableOrder`.

## Data Insertion

- Data for tables and orders has been populated to reflect various scenarios.
- Junction table `OrderHistoryDetail` is used to manage many-to-many relationships between `TableOrder` and `TableOrderHistory`.

## Queries

- Queries for retrieving orders by table or order history.
- Queries for retrieving all order histories for a specific order.
