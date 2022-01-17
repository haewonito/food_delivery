class WarehouseProductsController < ApplicationController
  def index
    @warehouse_products = WarehouseProduct.all
    @products
  end

  def show
    @warehouse_product = WarehouseProduct.find(params[:id])
  end

  def new
  end

  def create
    @warehouse_product = WarehouseProduct.create(warehouse_product_params)
    @products = Product.all
    @warehouse_products = WarehouseProduct.all
    # redirect_to :back
    redirect_to products_path
  end

  def edit
    @warehouse_product = WarehouseProduct.find(params[:id])

    # if params[:add]
    #   @warehouse_product.quantity +
    #
  end

  def update
    warehouse_product = WarehouseProduct.find(params[:id])
    warehouse_product.update(warehouse_product_params)

    redirect_to warehouse_products_path
  end

  def destroy
    WarehouseProduct.find(params[:id]).destroy
    redirect_to warehouse_products_path
  end

  private

  def warehouse_product_params
    params.permit(:product_id, :quantity, :warehouse_id)
  end
end
