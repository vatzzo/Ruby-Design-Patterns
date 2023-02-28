require_relative "./base_calculator.rb"

module DiscountCalculators
  class PointsBased < BaseCalculator
    def self.compute(context)
      1
    end
  end
end