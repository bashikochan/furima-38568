class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefectures_id, :city, :block, :building, :phone

  with_options presence: true do
    #orderモデルのバリデーション
    validates :user_id
    validates :item_id
    #orders_infoモデルのバリデーション
    validates :postcode
    validates :prefectures_id
    validates :city
    validates :block
    validates :building
    validates :phone
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    OrdersInfo.create(order_id: order.id, postcode: postcode, prefectures_id: prefectures_id, city: city, block: block, building: building, phone: phone)
  end
end