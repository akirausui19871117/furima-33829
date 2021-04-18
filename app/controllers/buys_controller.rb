class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new

  end

  def new
    @buy_address = BuyAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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


end
