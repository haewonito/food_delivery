Rails.application.routes.draw do
  get "/", to: "welcome#index"
  post "/warehouses/:warehouse_id/products/new", to: "warehouse_products#create"

  resources :warehouses do
    resources :products, controller: :warehouse_products
  end
  resources :products
  # resources :warehouse_products, controller: :inventories
  get "/warehouse_products", to: "inventories#index"
  get "/warehouse_products/new", to: "inventories#new"
  post "/warehouse_products", to: "inventories#create"
  get "/warehouse_products/:id/edit", to: "inventories#edit"
  patch "/warehouse_products/:id", to: "inventories#update"
  delete "/warehouse_products/:id", to: "inventories#destroy"

end
