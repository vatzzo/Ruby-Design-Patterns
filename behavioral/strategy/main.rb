require "json"

require_relative "../../common/file_reader.rb"
require_relative "./models/cart_item.rb"
require_relative "./models/product.rb"
require_relative "./models/promotions/discount.rb"
require_relative "./models/promotions/points_based.rb"
require_relative "./models/promotions/product_promotion.rb"
require_relative "./services/price_calculator.rb"

files = FileReader.call file_format: "json",
                        relative_path: "behavioral/strategy/data"
data = files.map { |file| JSON.parse file.read }.inject(&:merge)

indexed_products =
  data["products"].each_with_object({}) do |hash, dict|
    dict[hash["id"]] = Models::Product.from_hash hash
  end

cart_items = data["cart_items"].map do |hash|
  Models::CartItem.new product: indexed_products.fetch(hash["product_id"]),
                       quantity: hash["quantity"]
end

promotions = data["promotions"].map do |promotion_hash|
  mapper ||= {
    "DiscountPromotion" => Models::Promotions::Discount,
    "PointsBasedPromotion" => Models::Promotions::PointsBased
  }

  product_promotions = promotion_hash["products"].map do |pp_hash|
    Models::Promotions::ProductPromotion.new product: indexed_products.fetch(pp_hash["id"]),
                                             points: pp_hash["points"]
  end

  mapper.fetch(promotion_hash["type"]).new threshold: promotion_hash["threshold"],
                                           rebate: promotion_hash["rebate"],
                                           product_promotions: product_promotions
end

res = Services::PriceCalculator.call cart_items: cart_items, promotions: promotions
puts res
