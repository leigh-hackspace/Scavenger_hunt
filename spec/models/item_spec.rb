require 'rails_helper'

RSpec.describe Item, type: :model do
  it("should generate unique uuid") do
    expect(
      Item.create()
    ).not_to match(Item.create())
  end
  
end
