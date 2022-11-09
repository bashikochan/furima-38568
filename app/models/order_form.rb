class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefectures_id, :city, :block, :building, :phone

  with_options presence: true do
    #orderモデルのバリデーション
    validates :user_id
    validates :item_id
    #orders_infoモデルのバリデーション
    validates :postcode, presence: true, format: { with: /\A^[0-9]{3}-[0-9]{4}\z/, message: "is invalid.Enter it as follows(e.g. 123-4567)" }
    validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: true
    validates :block, presence: true
    validates :phone, format: { with: /\A[0-9]{9,10}\z/, message: "is invalid.Input only number" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    OrdersInfo.create(order_id: order.id, postcode: postcode, prefectures_id: prefectures_id, city: city, block: block, building: building, phone: phone)
  end
end