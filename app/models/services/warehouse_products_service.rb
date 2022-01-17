module Services
  class WarehouseProductsService
    attr_reader :warehouse_product_params

    def initialize(warehouse_product_params)
      @warehouse_product_params = warehouse_product_params
    end

    def call
      create_or_update_warehouse_product
    end

    private
    def warehouse_id
      warehouse_product_params[:warehouse_id]
    end

    def product_id
      warehouse_product_params[:product_id]
    end

    def quantity
      warehouse_product_params[:quantity].to_i
    end

    def create_or_update_warehouse_product
      if warehouse_product = WarehouseProduct.find_by(product_id: product_id, warehouse_id: warehouse_id)
        new_quantity = warehouse_product.quantity + quantity
        warehouse_product.update(quantity: new_quantity)
      else
        WarehouseProduct.create(warehouse_product_params)
      end
    end
  end
end
