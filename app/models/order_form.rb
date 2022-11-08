class OrderForm
  include ActiveModel::Model
  attr_accessor :user, :item

  with_options presence: true do
    validates :user
    validates :item
  end

  def save
    user = User.create(nickname: nickname, email: email, )
    item = Item.create(item_name: item_name, description: description, category_id: category_id, condition_id: condition_id, shipping_fee_id: shipping_fee_id,
      prefectures_id: prefectures_id, shipping_date_id: shipping_date_id, price: price, user_id: user_id)
    # 各テーブルにデータを保存する処理を書く
  end
end