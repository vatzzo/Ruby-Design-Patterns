require_relative "./base_calculator.rb"

module DiscountCalculators
  class PointsBased < BaseCalculator
    def compute context, cart_items:      
      indexed_cart_items = cart_items.each_with_object({}) do |item, hash|
        hash[item.product.id] = item
      end

      collected_points = context.product_promotions.sum do |pp|
        next unless item = indexed_cart_items[pp.product_id]

        item.quantity * pp.points
      end

      collected_points.div(context.threshold) * context.rebate
    end
  end
end
