Rails.application.routes.draw do
  resources :inventories, only: [:index, :new, :create, :edit, :update, :destroy]
end
