require_relative "./base_calculator.rb"

module DiscountCalculators
  class StandardDiscount < BaseCalculator
    TYPE = "DiscountPromotion"
    private_constant :TYPE

    def compute context
      1
    end
  end
end
