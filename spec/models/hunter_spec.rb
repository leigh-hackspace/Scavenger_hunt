require 'rails_helper'

RSpec.describe Hunter, type: :model do
  it "generates unique hunter uuid" do
    expect {self.generate_hunter_uuid}.not_to match self.generate_hunter_uuid
  end
end
