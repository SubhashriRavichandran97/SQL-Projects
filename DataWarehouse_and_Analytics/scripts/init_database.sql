-- Creating database and schemas

DROP DATABASE IF EXISTS DataWarehouse_Sales;

-- Create the 'Sales DataWarehouse' database
CREATE DATABASE DataWarehouse_Sales;
USE DataWarehouse_Sales;

-- Create the Schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
