class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefectures
  belongs_to :shipping_date

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  # ジャンル選択が「ーーー」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, presence: { message: "can't be blank"}

  VALID_PRICEL_HALF = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :price, numericality: { with: VALID_PRICEL_HALF, message: "is invalid.Input half-width characters" }
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to: 9999999,message:"is out of setting range"}
end

#1つのバリデーションヘルパーに、messageオプションは一つまで