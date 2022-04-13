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
end
