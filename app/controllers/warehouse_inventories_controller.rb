class WarehouseInventoriesController < ApplicationController
  # def update
  #   inventory = Inventory.find(params[:id])
  #   @updated_inventory = inventory.update(warehouse_id: params[:warehouse_id])
  #   redirect_to warehouse_path(params[:id])
  # end

  def edit
    @warehouse = Warehouse.find(params[:warehouse_id])
    @inventory = Inventory.find(params[:id])
  end

  # def update
  #   @warehouse = Warehouse.find(params[:warehouse_id])
  #   inventory = Inventory.find(params[:id])
  #   # require "pry"; binding.pry
  #   inventory.update(inventory_params)
  #   # redirect_to inventory_path(@inventory)
  #   redirect_to warehouse_path(@warehouse.id)
  # end
  #
  # private
  # def warehouse_inventory_params
  #   params.permit(:warehouse_id)
  # end
end
