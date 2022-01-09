a product has many inventories
a warehouse has many inventories

inventories has one product and one warehouse.

products table     one-to-many    inventories table
warehouses table   one-to-many    inventories table

THINGS TO THINK ABOUT REFACTOR
put unit in the product?  pounds, can, etc
might want to change product.storage_requirement to 123
TOTAL VALUE - should we just calculate it right there?  just going to
     make a very basic stuff for now, and refactor it later.  
unit_price listed both in inventories and products as of now.  better to
  put it on the product only and pull it out?  but then it seems too much
  to have to pull it out and calculate the total value
  maybe also good to just have it in inventories.  




process:
1. do the initial set up, set up the migration files and models relations. CHECKOUT TO A DIFFERENT BRANCH, do the relations and validations tests

2. set up seeds
