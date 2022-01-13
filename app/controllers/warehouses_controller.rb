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
    warehouse = Warehouse.create(warehouse_params)
    redirect_to warehouses_path
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    warehouse = Warehouse.find(params[:id])
    warehouse.update(warehouse_params)
    redirect_to warehouses_path
  end

  private

  def warehouse_params
    params.permit(:location_name, :phone_number, :address)
  end

end
