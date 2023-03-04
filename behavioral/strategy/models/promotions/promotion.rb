module Models
  module Promotions
    class Promotion
      def initialize(threshold:, rebate:, product_promotions:)
        @threshold = threshold
        @rebate = rebate
        @product_promotions = product_promotions
      end

      attr_reader :threshold, :rebate, :product_promotions

      def calculate_total_discount cart_items
        raise NotImplementedError
      end

      private

      def calculator
        raise NotImplementedError
      end
    end
  end
end
