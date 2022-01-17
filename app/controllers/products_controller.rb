class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
    product = Product.create(product_params)
    if product.save
      flash[:notice] = "New Product is successfully created"
      redirect_to products_path
    else
      flash[:alert] = "Product is not created: #{product.errors.messages}"
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to products_path
  end

  private

  def product_params
    params.permit(:name, :unit_price, :quantity_available, :storage_requirement)
  end

end
