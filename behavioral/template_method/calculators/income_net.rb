# Abstract class
module Calculators
  class IncomeNet
    def initialize(employee_details:)
      @employee_details = employee_details
    end

    def self.call(...)
      new(...).call
    end

    # Template method - closes a set of common operations
    def call
      calculate_salary_net
        .then { |salary| deduct_income_tax salary }
        .then { |salary| deduct_contributions salary }
        .then { |income_net| display_net_income income_net }
    end

    private

    attr_reader :employee_details

    def calculate_salary_net
      employee_details.rate * employee_details.contract_hours
    end

    def deduct_income_tax
      raise NotImplemented
    end

    def deduct_contributions
      raise NotImplemented
    end

    # Hook method - subclasses can overwrite this
    def display_net_income income
      puts "#{employee_details.name} earned #{income} zł."
    end
  end
end
