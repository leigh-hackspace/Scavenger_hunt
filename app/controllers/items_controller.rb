# frozen_string_literal: true

# :nodoc:
class ItemsController < ApplicationController
  def all
    @items = Item.all
<<<<<<< HEAD
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
=======
    @items = @items.sort_by(&:id)    
>>>>>>> c71a91a67855d4ce1865e7f1dac7831ec1ef53b8
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
=======
    
>>>>>>> c71a91a67855d4ce1865e7f1dac7831ec1ef53b8
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
<<<<<<< HEAD
    params.require(:item).permit(:title, :body, :image, :is_coupon, :is_claimed_coupon)
=======
    params.require(:item).permit(:title, :body, :image, :is_coupon)
>>>>>>> rework of mechanism for coupons
=======
    params.require(:item).permit(:title, :body, :image, :is_coupon, :is_claimed_coupon)
>>>>>>> fix coupon logic
=======
    params.require(:item).permit(:title, :body, :image, :is_coupon, :is_claimed_coupon)
>>>>>>> c71a91a67855d4ce1865e7f1dac7831ec1ef53b8
  end
end
