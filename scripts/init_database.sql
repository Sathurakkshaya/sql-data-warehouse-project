-- Warning: Once the database is dropped all the data within it will be lost, proceed with caution if needed.

-- Drop the Database "Datawarehouse if it already exists and recreate the database
DROP DATABASE IF EXISTS "Datawarehouse";
CREATE DATABASE "Datawarehouse";

-- Create the metallian architecture schemas 
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
