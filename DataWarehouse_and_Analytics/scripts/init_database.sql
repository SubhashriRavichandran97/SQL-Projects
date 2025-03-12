-- create 3 schema for 3 layers (bronze,silver,gold)

-- Drop existing schema if they exist
DROP SCHEMA IF EXISTS bronze;
DROP SCHEMA IF EXISTS silver;
DROP SCHEMA IF EXISTS gold;

-- Create the schema for each layer
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
