module Models
  class CartItem
    def initialize(product_id:, quantity:)
      @product_id = product_id
      @quantity = quantity
    end

    attr_reader :product_id, :quantity

    def self.from_hash hash
      new product_id: hash["product_id"], quantity: hash["quantity"]
    end
  end
end
