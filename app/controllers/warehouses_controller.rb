class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @warehouse_products = @warehouse.warehouse_products
  end

  def new
  end

  def create
    warehouse = Warehouse.create(warehouse_params)
    if warehouse.save
      flash[:notice] = "New Warehouse is successfully created"
      redirect_to warehouses_path
    else
      flash[:alert] = "Warehouse is not created: #{warehouse.errors.messages}"
      redirect_to new_warehouse_path
    end
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
