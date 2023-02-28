module DiscountCalculators
  class BaseCalculator
    def compute(context)
      raise NotImplementedError
    end
  end
end