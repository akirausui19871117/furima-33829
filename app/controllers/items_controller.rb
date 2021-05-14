class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_index_url, only: [:edit, :destroy]
  before_action :search_item, only: [:index, :search]

  def index
    @items = Item.order(created_at: :desc)
  end

  def search
    @results = @p.result
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @messages = Message.all
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def move_to_index_url
    redirect_to root_path if @item.buy.present?
  end

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
