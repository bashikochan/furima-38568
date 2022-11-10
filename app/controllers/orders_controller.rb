class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :prefectures_id, :city, :block, :building, :phone).merge(token: params[:token],
                                                                                                           user_id: current_user.id, item_id: params[:item_id])
  end

  def sold_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
