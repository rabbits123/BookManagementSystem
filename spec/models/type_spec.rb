require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'testing type association' do
    it {should have_many(:books)}
  end

  describe 'testing type presence' do
    it {should validate_presence_of(:typeofbook)}
  end
end
