# frozen_string_literal: true

# :nodoc:
class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = @items.sort_by(&:id)
  end

  def coupons
    @items = Item.all
    @items = @items.sort_by(&:id)
  end

  def clues
    @items = Item.all
    @items = @items.sort_by(&:id)
    @hunter = Hunter.find_by(:hunter_uuid => session[:hunter_uuid])
  end

  def show
    @item = Item.find_by_item_uuid(params[:item_uuid])
  end

  def new
    @item = Item.new
  end

  def create
    define_instance
    @item.item_uuid = SecureRandom.uuid

    if @item.save
      redirect_to item_path(@item.item_uuid)
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:item).permit(:title, :body, :image)
  end

  def define_instance
    @item = Item.new(permitted_params)
  end
end
