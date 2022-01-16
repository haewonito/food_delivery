#products categorized by storage_requirement
  #rt_perishable
@potatoes = Product.create!(name: "Potatoes", quantity_available: 100, unit_price: 15.65, storage_requirement: "rt_perishable")
@onions = Product.create!(name: "Onions", quantity_available: 100, unit_price: 12.50, storage_requirement: "rt_perishable")
  #refrigerated
@tomatoes = Product.create!(name: "Tomatoes", quantity_available: 100, unit_price: 7.50, storage_requirement: "refrigerated")
@milk = Product.create!(name: "Milk", quantity_available: 100, unit_price: 3.99, storage_requirement: "refrigerated")
@eggs = Product.create!(name: "Eggs", quantity_available: 100, unit_price: 4.99, storage_requirement: "refrigerated")
  #frozen
@puff_pastry = Product.create!(name: "Puff Pastry", quantity_available: 100, unit_price: 19.99, storage_requirement: "frozen")
@shrimp = Product.create!(name: "Shrimp", quantity_available: 100, unit_price: 15.99, storage_requirement: "frozen")
  #non_perishable
@rice = Product.create!(name: "Rice", quantity_available: 100, unit_price: 10.00, storage_requirement: "non_perishable")
@beans = Product.create!(name: "Beans", quantity_available: 100, unit_price: 10.00, storage_requirement: "non_perishable")
@linguine = Product.create!(name: "Linguine", quantity_available: 100, unit_price: 18.05, storage_requirement: "non_perishable")

#warehouses
@denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
@aurora_warehouse = Warehouse.create!(location_name: "Aurora", phone_number: "720-486-2958", address: "357 Lansing Ct, Aurora, CO 39573")
@fort_collins_warehouse = Warehouse.create!(location_name: "Fort Collins", phone_number: "303-249-2059", address: "305 S College Ave., Fort Collins, CO 80525")

#inventories categorized by product
  #potatoes
@inv1 = WarehouseProduct.create!(quantity: 2, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
@inv2 = WarehouseProduct.create!(quantity: 10, product_id: @potatoes.id, warehouse_id: @aurora_warehouse.id)
  #onions
@inv3 = WarehouseProduct.create!(quantity: 10, product_id: @onions.id, warehouse_id: @denver_warehouse.id)
@inv4 = WarehouseProduct.create!(quantity: 10, product_id: @onions.id, warehouse_id: @fort_collins_warehouse.id)
  #tomatoes
@inv5 = WarehouseProduct.create!(quantity: 8, product_id: @tomatoes.id, warehouse_id: @fort_collins_warehouse.id)
@inv6 = WarehouseProduct.create!(quantity: 10, product_id: @tomatoes.id, warehouse_id: @denver_warehouse.id)
@inv7 = WarehouseProduct.create!(quantity: 2, product_id: @tomatoes.id, warehouse_id: @aurora_warehouse.id)
  #milk
@inv8  = WarehouseProduct.create!(quantity: 40, product_id: @milk.id, warehouse_id: @aurora_warehouse.id)
@inv9  = WarehouseProduct.create!(quantity: 5, product_id: @milk.id, warehouse_id: @fort_collins_warehouse.id)
  #puff_pastry
@inv10 = WarehouseProduct.create!(quantity: 10, product_id: @puff_pastry.id, warehouse_id: @denver_warehouse.id)
@inv11 = WarehouseProduct.create!(quantity: 4, product_id: @puff_pastry.id, warehouse_id: @aurora_warehouse.id)
  #shrimp
@inv12 = WarehouseProduct.create!(quantity: 25, product_id: @shrimp.id, warehouse_id: @aurora_warehouse.id)
  #rice. inv15 and 16 are identical, but two different inventories
@inv13 = WarehouseProduct.create!(quantity: 40, product_id: @rice.id, warehouse_id: @aurora_warehouse.id)
@inv14 = WarehouseProduct.create!(quantity: 20, product_id: @rice.id, warehouse_id: @fort_collins_warehouse.id)
@inv15 = WarehouseProduct.create!(quantity: 5, product_id: @rice.id, warehouse_id: @denver_warehouse.id)
@inv16 = WarehouseProduct.create!(quantity: 5, product_id: @rice.id, warehouse_id: @denver_warehouse.id)
 #we are currently out of beans and linguines



  #inventories stored in Denver
    #inv1, 3, 6, 10, 15, 16
  #inventories stored in Aurora
    #inv2, 7, 8, 11, 12, 13
  #inventories stored in Fort Collines
    #inv4, 5, 9, 14
