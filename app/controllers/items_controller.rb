# frozen_string_literal: true

# :nodoc:
class ItemsController < ApplicationController
  def all
    @items = Item.all
    @items = @items.sort_by(&:id)
    #debugger
    
  end

  def clues
    @items = Item.all
    @items = @items.sort_by(&:id)
  end

  def show
    @item = Item.find_by_item_uuid(params[:item_uuid])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.item_uuid = SecureRandom.uuid
    if @item.is_coupon?
      c = Coupon.new()
      c.item_id = @item.item_uuid
      c.save()
    end
    

    if @item.save
      redirect_to item_path(@item.item_uuid)
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:title, :body, :image, :is_coupon)
  end
end
