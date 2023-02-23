class Salary
  def initialize(person_details:)
    @person_details = person_details
  end

  def calculate
    calculate_salary_net
      .then { |salary| deduct_income_tax salary }
      .then { |salary| deduct_contributions salary }
      .then { |income_net| display_net_income income_net }
  end

  private

  attr_reader :person_details

  def calculate_salary_net
    person_details.rate * person_details.contract_hours
  end

  def deduct_income_tax salary
    raise NotImplemented
  end

  def deduct_contributions salary
    raise NotImplemented
  end

  def display_net_income income
    puts "#{person_details.name} earned #{income} zł."
  end
end