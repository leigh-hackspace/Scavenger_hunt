class BonusItem < Item
  before_create :generate_code
  has_one :hunter

  def self.all
    Item.where.not(code: "")
  end

  private

  def generate_code
    self.code = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
