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
    warehouse_product = WarehouseProduct.create(warehouse_product_params)
    unit_price = warehouse_product.product.unit_price
    total_value = unit_price * warehouse_product.quantity
    @warehouse_product = warehouse_product.update(unit_price: unit_price, total_value: total_value)

    redirect_to warehouse_products_path
    #there's probably more elegant way to do this.  ask Cydnee
  end

  def edit
    @warehouse_product = WarehouseProduct.find(params[:id])
  end

  def update
    warehouse_product = WarehouseProduct.find(params[:id])
    warehouse_product.update(warehouse_product_params)
    # if warehouse_product_params[:product_id] == ""
    unit_price = warehouse_product.product.unit_price
    total_value = unit_price * warehouse_product.quantity
    warehouse_product.update(unit_price: unit_price, total_value: total_value)
    # end

    redirect_to warehouse_products_path
  end

  def destroy
    WarehouseProduct.find(params[:id]).destroy
    redirect_to warehouse_products_path
  end

  private

  def warehouse_product_params
    params.permit(:product_id, :quantity, :warehouse_id)
    #need to put unit_price if i want to give them the choice to put it in.
  end
end
