FactoryBot.define do
  factory :item do
    name { "Chew Toy" }
    description { "Best chew toy!" }
    unit_price {11.11}
    merchant_id {create(:merchant).id}
  end
end
