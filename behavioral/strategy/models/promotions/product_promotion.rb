module Models
  module Promotions
    class ProductPromotion
      def initialize(product:, points:)
        @product = product
        @points = points
      end

      def product_id
        product.id
      end
      
      attr_reader :product, :points
    end
  end
end
