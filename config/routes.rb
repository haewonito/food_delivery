Rails.application.routes.draw do
  get "/", to: "inventories#index"

  resources :inventories, :warehouses
end
