module Models
  class Product
    def initialize(id:, price:)
      @id = id
      @price = price
    end

    attr_reader :id, :price

    def self.from_hash hash
      new id: hash["id"], price: hash["price"]
    end
  end
end
