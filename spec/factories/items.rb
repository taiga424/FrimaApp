
FactoryBot.define do

  factory :item do

    name                  {"服"}
    description           {"服です"}
    price                 {"1000"}
    condition             {"新品、未使用"}
    fee                   {"送料込み（出品者が負担）"}
    area                  {"兵庫県"}
    shipping_days         {"１〜２日後に発送"}
    brand_id              {"1"}
    purchase_id           {"1"}
    user_id               {"1"}
    category_id           {"1"}
  end
end