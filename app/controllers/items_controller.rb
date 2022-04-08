# frozen_string_literal: true

# :nodoc:
class ItemsController < ApplicationController
  def all
    @items = Item.all
<<<<<<< HEAD
<<<<<<< HEAD
    @items = @items.sort_by(&:id)    
=======
    @items = @items.sort_by(&:id)
    #debugger
    
>>>>>>> Tweak controllers
=======
    @items = @items.sort_by(&:id)    
>>>>>>> fix coupon logic
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
<<<<<<< HEAD
<<<<<<< HEAD
    
=======
    if @item.is_coupon?
      c = Coupon.new()
      c.item_id = @item.item_uuid
      c.save()
    end
    

>>>>>>> rework of mechanism for coupons
=======
    
>>>>>>> fix coupon logic
    if @item.save
      if @item.is_coupon?
        c = Coupon.new()
        c.item_id = @item.item_uuid
        c.save()
      end
      redirect_to item_path(@item.item_uuid)
    else
      render :new
    end
  end

  def item_params
<<<<<<< HEAD
<<<<<<< HEAD
    params.require(:item).permit(:title, :body, :image, :is_coupon, :is_claimed_coupon)
=======
    params.require(:item).permit(:title, :body, :image, :is_coupon)
>>>>>>> rework of mechanism for coupons
=======
    params.require(:item).permit(:title, :body, :image, :is_coupon, :is_claimed_coupon)
>>>>>>> fix coupon logic
  end
end
