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

allow users to change unit_price on product?  becuase I
  am not letting it change in the inventories/new (reason?
  because there might be conflicts if everyone's allowed to change that.
  might be worth prepopulating it, so that the user can give different unit_price, if needs be)

better way to do inventories_controller#create (for fetching unit price and total_value)  call_back?

put flash messages in the controller when things are successfully updated, etc

#### adding inventory #####
<% if @inventories_found %>
<h3>Search Result: </h3>
<% @inventories_found.each do |inventory| %>
  <%= link_to "#{inventory.id}", inventory_path(inventory.id) %>
  <%= button_to "Add to the #{warehouse.location_name} Warehouse", warehouse_path, method: :post %>
<% end %>
<% end %>  
I think I can just do inventory.update and update the warehouse_id?

process:
1. do the initial set up, set up the migration files and models relations. CHECKOUT TO A DIFFERENT BRANCH, do the relations and validations tests

2. set up seeds
