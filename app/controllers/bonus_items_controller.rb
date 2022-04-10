class BonusItemsController < ItemsController
  def new
    @bonus_item = BonusItem.new
  end

  def create
    define_instance
    super
  end

  private

  def permitted_params
    params.require(:bonus_item).permit(:title, :body, :image)
  end

  def define_instance
    @item = BonusItem.new(permitted_params)
  end
end
