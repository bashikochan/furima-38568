FactoryBot.define do
  factory :order_form do
    postcode { '123-4567' }
    prefectures_id { 2 }
    city { '横浜市' }
    block { '1-1' }
    building { '横浜ハイツ' }
    phone { '06010001000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
