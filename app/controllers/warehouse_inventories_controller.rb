class WarehouseInventoriesController < ApplicationController
  # def update
  #   inventory = Inventory.find(params[:id])
  #   @updated_inventory = inventory.update(warehouse_id: params[:warehouse_id])
  #   redirect_to warehouse_path(params[:id])
  # end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update

    inventory = Inventory.find(params[:id])
    # require "pry"; binding.pry
    inventory.update(inventory_params)
    # require "pry"; binding.pry
    unit_price = inventory.product.unit_price
    total_value = unit_price * inventory.quantity
    # require "pry"; binding.pry
    inventory.update(unit_price: unit_price, total_value: total_value)

    # redirect_to inventory_path(@inventory)
    redirect_to inventories_path
  end

end
