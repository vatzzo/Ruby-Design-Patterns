require_relative "./base_service.rb"
require_relative "../discount_calculators/standard_discount"
require_relative "../discount_calculators/points_based"

module Services
  class PriceCalculator < BaseService
    def initialize(cart_items:, promotions:)
      @cart_items = cart_items
      @promotions = promotions
    end

    attr_reader :cart_items, :promotions

    def call
      calculate_total_items_price.then do |total_price|
        subtract_total_discount total_price
      end
    end

    private

    def calculate_total_items_price
      cart_items.sum { |item| item.price * item.quantity }
    end

    def subtract_total_discount total_price
      promotions.each do |promotion|
        total_price -= promotion.calculate_total_discount cart_items
      end

      total_price
    end
  end
end