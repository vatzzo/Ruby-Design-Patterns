require_relative "./base_calculator.rb"

module DiscountCalculators
  class StandardDiscount < BaseCalculator
    def compute context, cart_items:
      indexed_cart_items = cart_items.each_with_object({}) do |item, hash|
        hash[item.product.id] = item
      end

      result = 0
      factor = context.rebate.to_f / 100

      context.product_promotions.each do |pp|
        next unless item = indexed_cart_items[pp.product_id]

        result += (item.quantity * item.price * factor)
      end

      result
    end
  end
end
