module Services
  class PriceCalculator < BaseService
    def initialize(cart_items:, promotions:, products:)
      @cart_items = cart_items
      @promotions = promotions
      @products = products
    end

    private

    attr_reader :cart_items, :promotions, :products

    def call
      # TODO: Implement
    end

    def calculate_total_items_price
      cart_items.sum do |item|
        product = products[item.product_id]
        item.quantity * product.price
      end
    end
  end
end