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

    def product_available?
      product = Product.find(product_id)
      if product.quantity_available > quantity
        true
      else
        false
      end
    end

    def new_quantity_available
      product = Product.find(product_id)
      product.quantity_available - quantity
    end

    def create_or_update_warehouse_product
      if product_available?
        if warehouse_product = WarehouseProduct.find_by(product_id: product_id, warehouse_id: warehouse_id)
          new_quantity = warehouse_product.quantity + quantity
          warehouse_product.update(quantity: new_quantity)
          warehouse_product.product.update(quantity_available: new_quantity_available)
        else
          WarehouseProduct.create(warehouse_product_params)
        end
      else
        false
      end
    end
  end
end
