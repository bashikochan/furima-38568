class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path    
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_fee_id, :prefectures_id, :shipping_date)
  end
end

