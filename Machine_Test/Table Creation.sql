CREATE TABLE sneha_Test..Category (
    ID int NOT NULL,
    Name varchar(50) NOT NULL,
    PRIMARY KEY (ID)
);

--drop table sneha_Test..Products

CREATE TABLE sneha_Test..Products (
ID int IDENTITY(1,1) PRIMARY KEY,
CategoryID int not null,
Name varchar(50),
description varchar(max),
SKU varchar(10),
ImagePath varchar(max),
SellingPrice decimal(10,2),
AvaliableQty int,
type VARCHAR(10) Not Null Check (type IN('Physical', 'Virtual')),
Weight decimal(10,2),
length	Int,
width Int,
Height Int,
ShippingCost Decimal(10,2),
CONSTRAINT FK_category FOREIGN KEY (CategoryID)
REFERENCES sneha_Test..Category(ID)
);


