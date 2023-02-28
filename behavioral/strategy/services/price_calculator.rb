require_relative "./base_service.rb"
require_relative "../discount_calculators/standard_discount"
require_relative "../discount_calculators/points_based"

module Services
  class PriceCalculator < BaseService
    DISCOUNT_CALCULATORS = {
      "PointsBasedPromotion" => DiscountCalculators::PointsBased.new,
      "DiscountPromotion" => DiscountCalculators::StandardDiscount.new
    }
    private_constant :DISCOUNT_CALCULATORS

    def initialize(cart_items:, promotions:, products:)
      @cart_items = cart_items
      @promotions = promotions
      @products = products
    end

    attr_reader :cart_items, :promotions, :products

    def call
      calculate_total_items_price.then do |total_price|
        subtract_total_discount total_price
      end
    end

    private

    def calculate_total_items_price
      cart_items.sum do |item|
        product = products[item.product_id]
        item.quantity * product.price
      end
    end

    def subtract_total_discount total_price
      promotions.pluck(:type).uniq each do |promotion_type|
        total_price -= DISCOUNT_CALCULATORS[promotion_type].compute self
      end
      total_price
    end
  end
end