# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hunter, type: :model do
  it('should generate unique uuid') do
    expect(
      Hunter.create(hunter_name: 'test', password: 'password1')
    ).not_to match(Hunter.create(hunter_name: 'test2', password: 'password1'))
  end

  it('should generate a session id') do
    expect(
      Hunter.create(hunter_name: 'test', password: 'password1')
    ).not_to match(Hunter.create(hunter_name: 'test2', password: 'password1'))
  end
end
