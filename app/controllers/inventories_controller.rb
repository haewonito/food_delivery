class InventoriesController < ApplicationController
  def index
    @warehouse_products = WarehouseProduct.all
  end

  def new
    # @warehouse = Warehouse.find(params)
  end

  def create
    @warehouse_product = WarehouseProduct.create(warehouse_product_params)
    # if @warehouse_product.save
    redirect_to "/warehouse_products"
    #   flash[:notice] = "New Inventory Is Successfully Created!"
    # else
    #   redirect_to "/warehouse_products/new"
    #   flash[:alert] = "Error: Try Again"
    # end
  end

  def edit
    @warehouse_product = WarehouseProduct.find(params[:id])
  end

  def update
    warehouse_product = WarehouseProduct.find(params[:id])
    warehouse_product.update(warehouse_product_params)

    redirect_to "/warehouse_products"
  end

  def destroy
    WarehouseProduct.find(params[:id]).destroy
    redirect_to "/warehouse_products"
  end

  private
  def warehouse_product_params
    params.permit(:product_id, :quantity, :warehouse_id)
  end
end
