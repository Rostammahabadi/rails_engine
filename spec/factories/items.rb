FactoryBot.define do
  factory :item do
    name { "Chew Toy" }
    description { "Best chew toy!" }
    unit_price {1111}
    merchant_id {create(:merchant).id}
  end
end
