class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # orders_infoモデルのバリデーション
    validates :postcode, format: { with: /\A^[0-9]{3}-[0-9]{4}\z/, message: 'is invalid.Enter it as follows(e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone, numericality: { only_integer: true, message: 'is invalid.Input only number' }
    validates :phone, allow_blank: true, length: { maximum: 11, message: 'is too long' }
    validates :phone, allow_blank: true, length: { minimum: 10, message: 'is too short' }
    validates :token

  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    OrdersInfo.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                      building: building, phone: phone)
  end

end
