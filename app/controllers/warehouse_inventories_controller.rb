class WarehouseInventoriesController < ApplicationController
  def update
    inventory = Inventory.find(params[:id])
    @updated_inventory = inventory.update(warehouse_id: params[:warehouse_id])
    redirect_to warehouse_path(params[:id])
  end
end
