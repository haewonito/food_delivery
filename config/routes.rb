Rails.application.routes.draw do
  get "/", to: "welcome#index"

  #I need to figure out where I am sending a post request to /warehouses/warehouses/:id/:warehouse_product_id
  #but it's late and i can't figure it out, so I just messed with the routes for a quick fix.
  # patch "/warehouses/:id/:warehouse_product_id", to: "warehouse_warehouse_products#update"
  # resources :warehouse_products
  # resources :warehouses do
  #   resources :warehouse_products
  # # end
  # resources :warehouses
  # resources :products
  #
  # concern :warehouse_products_table do
  #   resources :warehouse_products
  # end
  post "/warehouses/:warehouse_id/products/new", to: "warehouse_products#create"
  resources :warehouses do
    resources :products, controller: :warehouse_products
  end
  resources :products
  # resources :warehouse_products

end
