Rails.application.routes.draw do
  get "/", to: "warehouse_products#index"

  #I need to figure out where I am sending a post request to /warehouses/warehouses/:id/:warehouse_product_id
  #but it's late and i can't figure it out, so I just messed with the routes for a quick fix.
  # patch "/warehouses/:id/:warehouse_product_id", to: "warehouse_warehouse_products#update"
  # resources :warehouse_products
  # resources :warehouses do
  #   resources :warehouse_products
  # end
  resources :warehouses
  resources :products

end
