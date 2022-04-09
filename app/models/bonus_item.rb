class BonusItem < Item
  before_create :generate_code
  has_one :hunter

  def self.all
    Item.where.not(code: "")
  end

  def self.capture(hunter, item)
    begin
      raise "already" if hunter.bonus_item.present?
      raise "claimed" if item.hunters.present?
      hunter.update(bonus_item: item)
    end
  end

  private

  def generate_code
    self.code = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
