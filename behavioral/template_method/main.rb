require "json"

require_relative "../../common/file_reader.rb"
require_relative "./salary_tax_one.rb"
require_relative "./salary_tax_two.rb"

mapper = {
  1 => SalaryTaxOne,
  2 => SalaryTaxTwo
}

files = FileReader.call file_format: "json",
                        relative_path: "behavioral/template_method/data"

arr = files.map { |file| JSON.parse file.read }
           .first.fetch "employees"

arr.each do |person_details|
  klass = mapper.fetch person_details["taxation_form"]

  PersonDetails ||= Struct.new :name, :business_period_in_months, :rate, :contract_hours, keyword_init: true
  PersonDetails.new(
    name: person_details["name"],
    business_period_in_months: person_details["business_period_in_months"],
    rate: person_details["rate"],
    contract_hours: person_details["contract_hours"]
  ).then do |details|
    klass.new(person_details: details).calculate
  end
end
