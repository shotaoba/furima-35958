FactoryBot.define do
  factory :user do
    nickname              {"test"}
    last_name             {"山田"}
    first_name            {"陸太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"リクタロウ"}
    birthday              {"20000101"}
    email                 {"test@example"}
    password              {"aaa000000"}
    password_confirmation {password}
  end
end