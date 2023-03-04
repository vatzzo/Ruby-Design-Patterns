require_relative "./promotion.rb"
require_relative "../../discount_calculators/standard_discount.rb"

module Models
  module Promotions
    class Discount < Promotion
      def calculate_total_discount cart_items
        calculator.compute self, cart_items: cart_items
      end

      private

      def calculator
        @calculator ||= DiscountCalculators::StandardDiscount.new
      end
    end
  end
end
