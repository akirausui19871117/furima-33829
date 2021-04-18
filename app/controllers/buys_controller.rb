class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item,only: [:index,:create]
  before_action :move_to_index_url, only: [:index]
  
  def index
    @buy_address = BuyAddress.new
    if current_user.id == @item.user.id
      redirect_to root_path
    end


  end

  def new
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buys_params)
    if @buy_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buys_params[:token],
        currency: 'jpy'
      )
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def buys_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city,:house_number, :building_name,:phone_number).merge(token: params[:token],user_id: current_user.id, item_id:@item.id )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index_url
    if @item.buy.present?
      redirect_to root_path
    end

  end
end

