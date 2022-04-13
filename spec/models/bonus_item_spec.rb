require 'rails_helper'

RSpec.describe BonusItem, type: :model do
  it "has a valid factory" do
    expect(create(:bonus_item)).to be_valid
  end

  it "should generate a code on creation" do
    expect(BonusItem.create.code).not_to eq("")
  end

end
