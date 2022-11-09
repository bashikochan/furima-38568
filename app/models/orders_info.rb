class OrdersInfo < ApplicationRecord
  has_one_active_hash :prefectures
  belongs_to :order
end
