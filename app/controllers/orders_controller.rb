class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_item, only: [:index, :create]


  def index
    @order_form = OrderForm.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :prefectures_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def sold_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
