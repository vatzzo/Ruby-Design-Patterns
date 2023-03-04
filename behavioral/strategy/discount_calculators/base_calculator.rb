module DiscountCalculators
  class BaseCalculator
    def compute context, cart_items:
      raise NotImplementedError
    end
  end
end
