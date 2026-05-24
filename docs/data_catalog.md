
**Data Dictionary For Gold Layer**
**Overview**
The gold layer is the business level data representation structured to support analytical and reporting use cases. It consists of dimension tables and fact tables for specific business metrics.

**1.Gold.dim_customers**
•	**Purpose** : Stores customer details enriched with demographic and geographic data.
•	**Columns** : 


| **Column Name** | **Data Type** | **Description**                                                                       |
| --------------- | ------------- | ------------------------------------------------------------------------------------- |
| Customer_key    | INT           | Surrogate key uniquely identifying each customer record in the dimension table.       |
| Customer_id     | INT           | Unique numerical identifier assigned to each customer                                 |
| Customer_number | NVARCHAR(50)  | Alphanumeric identifier representing the customer , used for tracking and referencing |
| first_name      | NVARCHAR(50)  | Customers first name as recorded in the system                                        |
| Last_name       | NVARCHAR(50)  | Customers last name or family name                                                    |
| country         | NVARCHAR(50)  | The country of residence for the customer(Eg : Australia)                             |
| marital_status  | NVARCHAR(50)  | The marital status of the customer(Eg: married or single)                             |
| gender          | NVARCHAR(50)  | The gender of the customer(Eg: Male or Female)                                        |
| birth_date      | DATE          | The date of birth of the customer formatted as YYYY-MM-DD(Eg: 1971-10-06)             |
| Create_date     | DATE          | The date and time when the customer record was created in the system.                 |
