class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
  end

end
