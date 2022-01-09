class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
  end

  def create
    inventory = Inventory.create(inventory_params)
    unit_price = inventory.product.unit_price
    total_value = unit_price * inventory.quantity
    @inventory = inventory.update(unit_price: unit_price, total_value: total_value)

    redirect_to inventories_path
    #there's probably more elegant way to do this.  ask Cydnee
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    inventory = Inventory.find(params[:id])
    inventory.update(inventory_params)
    unit_price = inventory.product.unit_price
    total_value = unit_price * inventory.quantity
    require "pry"; binding.pry
    @inventory = inventory.update(unit_price: unit_price, total_value: total_value)

    # redirect_to inventory_path(@inventory)
    redirect_to inventories_path
  end

  def destroy

  end

  private

  def inventory_params
    params.permit(:product_id, :quantity, :warehouse_id)
    #need to put unit_price if i want to give them the choice to put it in.
  end
end
