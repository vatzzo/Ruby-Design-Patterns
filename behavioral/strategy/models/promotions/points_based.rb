require_relative "./promotion.rb"
require_relative "../../discount_calculators/points_based.rb"

module Models
  module Promotions
    class PointsBased < Promotion
      def calculate_total_discount cart_items
        calculator.compute self, cart_items: cart_items
      end

      private

      def calculator
        @calculator ||= DiscountCalculators::PointsBased.new
      end
    end
  end
end
