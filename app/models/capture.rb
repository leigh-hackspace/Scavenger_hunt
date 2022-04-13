class Capture
  def initialize(hunter, item)
    @hunter = hunter
    @item = item
  end

  def self.the_item(hunter:, item:)
    self.new(hunter, item).the_item
  end

  def the_item
    if item.is_bonus_item?
      capture_bonus_item
    else
      capture_item
    end
  end

  private

  attr_accessor :hunter, :item

  def capture_bonus_item
    return :you_already_have_a_bonus_item if hunter.bonus_item.present?
    return :this_bonus_item_has_already_been_claimed if item.hunters.present?

    hunter.update(bonus_item: item)
    hunter.items << item unless hunter.items.include? item
    :success
  end

  def capture_item
    if hunter.items.include? item
      :you_already_have_this_item
    else
      hunter.items << item
      :success
    end
  end
end
