
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


**2.Gold.dim_products**

 •**Purpose**: Provides information about the products and their attributes.

**•	Columns** : 

| **Column name**      | **Data type** | **Description**                                                                            |
| -------------------- | ------------- | ------------------------------------------------------------------------------------------ |
| product_key          | INT           | Surrogate key uniquely identifying each product record in the product dimension table.     |
| product_id           | INT           | A unique identifier assigned to the product for internal tracking and referencing.         |
| product_name         | NVARCHAR      | Descriptive name of the product ,including key details such as type, name, and size        |
| category_id          | NVARCHAR      | A unique identifier for the product’s category,linking to its higher level classification. |
| category             | NVARCHAR      | The boarder classification of the product (Eg: Bike, Components) to group related items.   |
| subcategory          | NVARCHAR      | A more detailed classification of the product within the category such as product type.    |
| maintenance_required | NVARCHAR      | Indicates whether the product required maintenance or not(Eg: yes or no)                   |
| cost                 | INT           | Cost or base price of the product, measured in monetary units.                             |
| product_line         | NVARCHAR      | The specific product line or series to which the product belongs(Eg: road,mountain)        |
| start_date           | DATE          | The date when the product became available for sale or use.                                |


3.gold.fact_sales

•	Purpose : Stores transactional sales data for analytical purpose.

•	Columns : 

| **Column name** | **Data type** | **Description**                                                                       |
| --------------- | ------------- | ------------------------------------------------------------------------------------- |
| Order_number    | NVARCHAR      | A unique alphanumeric identifier for each sales order                                 |
| Product_key     | INT           | Surrogate key linking the order to the product dimension table                        |
| customer_key    | INT           | Surrogate key linking the order to the customer dimension table                       |
| order_date      | DATE          | The date when the order was placed.                                                   |
| shipping_date   | DATE          | The date when the order was shipped to the customer.                                  |
| due_date        | DATE          | The date when the order payment was due.                                              |
| sales_amount    | INT           | The total monetary value of the sale for the line item,in whole currency units(eg:25) |
| quantity        | INT           | The number of units of the product ordered for the line item(eg.1)                    |
| price           | INT           | The price per unit of the product for the line item,in whole currency units.          |



