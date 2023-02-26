module Models
  class Promotion
    class ProductPromotion
      def initialize(product_id:, points:)
        @product_id = product_id
        @points = points
      end
      
      attr_reader :product_id, :points

      def self.from_hash hash
        new product_id: hash["product_id"], points: hash["points"]
      end
    end

    def initialize(type:, threshold:, product_promotions_arr:)
      @type = type
      @threhsold = threshold
      @product_promotions = product_promotions_arr.map { |hash| ProductPromotion.from_hash hash }
    end

    attr_reader :type, :threhsold, :product_promotions

    def self.from_hash hash
      new type: hash["type"],
          threshold: hash["threshold"],
          product_promotions_arr: hash["products"]
    end
  end
end
