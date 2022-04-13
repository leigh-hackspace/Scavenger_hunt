class Status
  def self.decide(status)
    self.new(status).decide
  end

  def initialize(status)
    @status = status
  end

  def decide
    case status
    when :this_bonus_item_has_already_been_claimed
      1
    when :you_already_have_a_bonus_item
      2
    when :you_already_have_this_item
      3
    when :success
      4
    else
      5
    end
  end

  private

  attr_reader :status
end
