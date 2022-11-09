class OrderForm
  include ActiveModel::Model
  attr_accessor :nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth

  with_options presence: true do
    validates :user
    validates :item
  end

  def save
    user = User.create(nickname: nickname, email: email, password: password, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birth: birth)
    item = Item.create(item_name: item_name, description: description, category_id: category_id, condition_id: condition_id, shipping_fee_id: shipping_fee_id,
      prefectures_id: prefectures_id, shipping_date_id: shipping_date_id, price: price, user_id: user_id)
    # 各テーブルにデータを保存する処理を書く
  end
end