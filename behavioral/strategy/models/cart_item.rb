module Models
  class CartItem
    def initialize(product:, quantity:)
      @product = product
      @quantity = quantity
    end

    def price
      product.price
    end

    attr_reader :product, :quantity
  end
end
