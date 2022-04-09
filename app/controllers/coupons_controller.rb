# frozen_string_literal: true

# :nodoc:
class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all.sort_by(&:id)
  end

  def show
    @coupon = Coupon.find_by("id" => params[:id])
    @hunter = Hunter.find_by("hunter_uuid" => session[:hunter_uuid])
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    @coupon.is_claimed = false
    if @coupon.save
      redirect_to coupon_path(@coupon.id)
    else
      render :new
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:coupon, :is_claimed)
  end
end