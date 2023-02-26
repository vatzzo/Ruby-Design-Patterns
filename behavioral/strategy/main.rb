require "json"

require_relative "../../common/file_reader.rb"
require_relative "./models/cart_item.rb"
require_relative "./models/product.rb"
require_relative "./models/promotion.rb"

files = FileReader.call file_format: "json",
                        relative_path: "behavioral/strategy/data"
data = files.map { |file| JSON.parse file.read }.inject(&:merge)

indexed_products =
  data["products"].each_with_object({}) do |hash, dict|
    hash["id"].then { |product_id| Models::Product.from_hash hash }
  end

cart_items = data["cart_items"].map { |hash| Models::CartItem.from_hash hash }
promotions = data["promotions"].map { |hash| Models::Promotion.from_hash hash }
