require 'rails_helper'

RSpec.describe BonusItem, type: :model do
  it "should generate a code on creation" do
    expect(BonusItem.create.code).not_to eq("")
  end
end
