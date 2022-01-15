Rails.application.routes.draw do
  get "/", to: "inventories#index"

  #I need to figure out where I am sending a post request to /warehouses/warehouses/:id/:inventory_id
  #but it's late and i can't figure it out, so I just messed with the routes for a quick fix.
  patch "/warehouses/:id/:inventory_id", to: "warehouse_inventories#update"
  resources :inventories, :warehouses
end
