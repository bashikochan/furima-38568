class OrdersInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures
  belongs_to :order
end
