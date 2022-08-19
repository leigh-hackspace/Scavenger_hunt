# frozen_string_literal: true

# :nodoc:
class CipherItemsController < ApplicationController
  def index
    @cipheritems = CipherItem.all
  end

  def show
    @ciperitem = CipherItem.find_by_item_uuid(params[:item_uuid])
  end

  def new
    @cipheritem = CipherItem.new
  end

<<<<<<< HEAD
  def clues
    @cipheritems = CipherItem.all
  end

  def create
    define_instance
    @cipheritem.item_uuid = SecureRandom.uuid
    @cipheritem.rotation = 2 #rand(1..25) # i know xD 
=======
  def create
    define_instance
    @cipheritem.item_uuid = SecureRandom.uuid
    @cipheritem.rotation = rand(1..25)
>>>>>>> Add cipher item for cryptic hunt
    @cipheritem.set_cipher_text(params[:cipher_item][:clear_text])
    if @cipheritem.save
      redirect_to cipher_items_path(@cipheritem.item_uuid)
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:cipher_item).permit(:clear_text)
  end

  def define_instance
    @cipheritem = CipherItem.new(permitted_params)
  end
end
