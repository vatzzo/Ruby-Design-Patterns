require_relative "./salary.rb"

class SalaryTaxTwo < Salary
  CONTRIBUTION_RATE = 1200
  INCOME_TAX_RATE = 2000
  private_constant :CONTRIBUTION_RATE, :INCOME_TAX_RATE

  def deduct_income_tax salary
    salary - INCOME_TAX_RATE
  end

  def deduct_contributions salary
    salary - CONTRIBUTION_RATE
  end
end
