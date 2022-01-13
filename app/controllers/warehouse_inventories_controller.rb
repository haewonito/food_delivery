class WarehouseInventoriesController < ApplicationController
  def create
    inventory = Inventory.find(params[:inventory_id])
    @updated_inventory = inventory.update(warehouse_id: params[:id])
    redirect_to warehouse_path(params[:id])
  end
end
