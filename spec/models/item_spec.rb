# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a valid factory" do
    expect(create(:item)).to be_valid
  end

  it('should generate unique uuid') do
    expect(
      Item.create
    ).not_to match(Item.create)
  end

  describe "capturing items" do
    before :each do
      @item = create(:item)
      @item_two = create(:item)
      @hunter = create(:hunter)
    end

    context "when a hunter doesn't have the item" do
      it "allows capture" do
        @item.capture(@hunter)

        expect(@hunter.items.count).to eq(1)
      end
    end

    context "doesn't let the hunter" do
      it "catch an item twice" do
        @item.capture(@hunter)
        @item.capture(@hunter)

        expect(@hunter.items.count).to eq(1)
      end
    end
  end
end
