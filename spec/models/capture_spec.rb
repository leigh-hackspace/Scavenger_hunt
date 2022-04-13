# frozen_string_literal: true

require "rails_helper"

RSpec.describe Capture, type: :model do
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
