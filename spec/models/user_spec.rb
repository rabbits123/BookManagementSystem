require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'testing user association' do
      it {should have_many(:books)}
  end
end
