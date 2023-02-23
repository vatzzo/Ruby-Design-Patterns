require_relative "./salary.rb"

class SalaryTaxOne < Salary
  CONTRIBUTION_RATES = {
    [1,3] => 300,
    [4,24] => 700,
    [24, Float::INFINITY] => 1200
  }.freeze
  INCOME_TAX_PERCENTAGE = 0.12
  private_constant :CONTRIBUTION_RATES, :INCOME_TAX_PERCENTAGE

  def deduct_income_tax salary
    salary * (1.0 - INCOME_TAX_PERCENTAGE)
  end

  def deduct_contributions salary
    rate = CONTRIBUTION_RATES.detect do |range, value|
      person_details.business_period_in_months.between?(*range)
    end[1]

    salary - rate
  end
end
