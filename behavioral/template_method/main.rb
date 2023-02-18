require "json"

require_relative "../../common/file_reader.rb"
require_relative "./salary_calculator_tax_one.rb"
require_relative "./salary_calculator_tax_two.rb"

mapper = {
  1 => SalaryCalculatorTaxOne,
  2 => SalaryCalculatorTaxTwo
}

files = FileReader.call file_format: "json",
                        relative_path: "behavioral/template_method/data"

data = files.map { |file| JSON.parse file.read }
            .first.fetch "employees"

puts data
