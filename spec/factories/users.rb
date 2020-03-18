FactoryBot.define do

  factory :user do

    nickname              {"taro"}
    email                 {"t1@taro.com"}
    first_name            {"太郎"}
    last_name             {"山田"}
    furigana_first        {"タロウ"}
    furigana_last         {"ヤマダ"}
    birthdate             {"2010-07-11"}
    tell                  {"00000000000"}
    password              {"taro123"}

  end

end