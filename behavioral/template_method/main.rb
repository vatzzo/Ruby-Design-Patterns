require "json"

require_relative "../../common/file_reader.rb"
require_relative "./calculators/income_net_tax_form_1.rb"
require_relative "./calculators/income_net_tax_form_2.rb"

CALCULATOR_MAPPER = {
  1 => Calculators::IncomeNetTaxForm1,
  2 => Calculators::IncomeNetTaxForm2
}

PersonDetails = Struct.new :name, :business_period_in_months, :rate, :contract_hours,
                           keyword_init: true

files = FileReader.call file_format: "json",
                        relative_path: "behavioral/template_method/data"

employee_details_arr = files.map { |file| JSON.parse file.read }.first.fetch("employees")
employee_details_arr.each do |employee_details|
  calculator = CALCULATOR_MAPPER.fetch employee_details.fetch "taxation_form"

  PersonDetails.new(
    name: employee_details["name"],
    business_period_in_months: employee_details["business_period_in_months"],
    rate: employee_details["rate"],
    contract_hours: employee_details["contract_hours"]
  ).then { |details| calculator.call employee_details: details }
end
