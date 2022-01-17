class WarehouseProductsController < ApplicationController
  def index
    @warehouse_products = WarehouseProduct.all
  end

  def show
    @warehouse_product = WarehouseProduct.find(params[:id])
  end

  def new
  end

  def create
    if Services::WarehouseProductsService.new(warehouse_product_params).call != false
      redirect_to products_path
    else
      flash[:alert] = "We don't have enough products for this request"
      redirect_to products_path
    end
  end

  def edit
    @warehouse_product = WarehouseProduct.find(params[:id])
  end

  def update
    if Services::WarehouseProductsService.new(warehouse_product_params).call != false
      redirect_to warehouse_products_path
    else
      flash[:alert] = "We don't have enough products for this request"
      redirect_to warehouse_products_path
    end
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
