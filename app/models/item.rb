class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefectures
  belongs_to :shipping_date

  # ジャンル選択が「ーーー」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"} 

end
