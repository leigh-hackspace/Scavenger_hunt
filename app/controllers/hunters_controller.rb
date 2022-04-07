# frozen_string_literal: true

# Hunters class responsible for creating new sessions and capturing things
class HuntersController < ApplicationController
  def all
    @hunters = Hunter.all
  end

  def show
    @hunter = Hunter.find_by_hunter_uuid(params[:hunter_uuid])
  end

  def new
    @hunter = Hunter.new
  end

  def assign_session(session, hunter)
    session[:hunter_name] = hunter.hunter_name
    session[:hunter_uuid] = hunter.hunter_uuid
    session[:hunter_session_id] = hunter.generate_session_id
    session[:is_admin] = hunter.is_admin?
    redirect_to hunter_path(@hunter.hunter_uuid)
  end

  def create
    @hunter = Hunter.new(hunter_params)
    if doesnt_exist(hunter_params[:hunter_name])
      if @hunter.save
        assign_session(session, @hunter)
      else
        render :new
      end
    else
      redirect_to "#{root_path}register", message: 'User already exists!'
    end
  end

  def check_valid_session(current_session_id, hunter, item)
    return unless current_session_id == hunter.generate_session_id

    hunter.items << @item unless @hunter.items.include? item
    tweet_capture(@hunter.hunter_name, item.title)
  end

  def capture
    @hunter = Hunter.find_by_hunter_uuid(params[:hunter_uuid])
    @item = Item.find_by_item_uuid(params[:item_uuid])

    if @item.is_coupon?
      unless @hunter.has_coupon
        
        mark_coupon_claimed(@item.item_uuid)
      end
    end
      check_valid_session(session[:hunter_session_id], @hunter, @item)
      redirect_to hunter_path(@hunter.hunter_uuid)
    
  end

  def check_if_hunter_has_coupon(hunter)
    hunter.items.each do |i|
      if i.is_coupon
        return true
      end
    end
    return false
  end

  def mark_coupon_claimed(item_uuid)

    @coupon = Coupon.find_by("item_id" => item_uuid)
    @coupon.is_claimed = true
    @coupon.save
  end

  def hunter_params
    params.require(:hunter).permit(:hunter_name, :hunter_uuid, :password, :item_uuid)
  end

  def doesnt_exist(hunter_name)
    h = Hunter.find_by_hunter_name(hunter_name)
    if h
      false
    else
      true
    end
  end
end
