-- 1. Create Customers Table
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50)
);

-- 2. Create Categories Table
CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Create SubCategories Table
CREATE TABLE SubCategories (
    SubCategoryID SERIAL PRIMARY KEY,
    SubCategoryName VARCHAR(50) NOT NULL UNIQUE,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 4. Create PaymentModes Table
CREATE TABLE PaymentModes (
    PaymentModeID SERIAL PRIMARY KEY,
    PaymentModeName VARCHAR(50) NOT NULL UNIQUE
);

-- 5. Create Orders Table
CREATE TABLE Orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 6. Create OrderDetails Table
CREATE TABLE OrderDetails (
    RecordID SERIAL PRIMARY KEY,
    OrderID VARCHAR(20) NOT NULL,
    SubCategoryID INT NOT NULL,
    PaymentModeID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Profit DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (SubCategoryID) REFERENCES SubCategories(SubCategoryID),
    FOREIGN KEY (PaymentModeID) REFERENCES PaymentModes(PaymentModeID)
);