class WarehouseInventoriesController < ApplicationController
  # def update
  #   warehouse_product = WarehouseProduct.find(params[:id])
  #   @updated_warehouse_product = warehouse_product.update(warehouse_id: params[:warehouse_id])
  #   redirect_to warehouse_path(params[:id])
  # end

  def edit
    @warehouse = Warehouse.find(params[:warehouse_id])
    @warehouse_product = WarehouseProduct.find(params[:id])
  end

  # def update
  #   @warehouse = Warehouse.find(params[:warehouse_id])
  #   warehouse_product = WarehouseProduct.find(params[:id])
  #   # require "pry"; binding.pry
  #   warehouse_product.update(warehouse_product_params)
  #   # redirect_to warehouse_product_path(@warehouse_product)
  #   redirect_to warehouse_path(@warehouse.id)
  # end
  #
  # private
  # def warehouse_warehouse_product_params
  #   params.permit(:warehouse_id)
  # end
end
