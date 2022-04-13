require 'rails_helper'

RSpec.describe BonusItem, type: :model do
  it "has a valid factory" do
    expect(create(:bonus_item)).to be_valid
  end

  it "should generate a code on creation" do
    expect(BonusItem.create.code).not_to eq("")
  end

  describe "capturing bonus items" do
    before :all do
      @bonus_item = create(:bonus_item)
      @bonus_item_two = create(:bonus_item)
      @hunter = create(:hunter)
    end

    context "when it hasn't been captured" do
      it "allows capture" do
        @bonus_item.capture(@hunter)

        expect(@hunter.bonus_item).to be(@bonus_item)
      end
    end

    context "when a hunter already owns one" do
      it "doesn't allow capture" do
        @bonus_item_two.capture(@hunter)

        expect(@hunter.bonus_item).to be(@bonus_item)
        expect(@hunter.bonus_item).not_to be(@bonus_item_two)
      end
    end
  end
end
