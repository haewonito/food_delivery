a product has many inventories
a warehouse has many inventories

inventories has one product and one warehouse.

products table     one-to-many    inventories table
warehouses table   one-to-many    inventories table

might want to change product.storage_requirement to 123




process:
1. do the initial set up, set up the migration files and models relations. CHECKOUT TO A DIFFERENT BRANCH, do the relations and validations tests

2. set up seeds
