class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @inventories = @warehouse.inventories
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
