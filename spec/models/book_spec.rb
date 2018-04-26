require 'rails_helper'


=begin
RSpec.describe Book, type: :model do
  describe "Validate book attributes" do
    it 'book without title should return false' do
      book = Book.new(title: "dasdas", content: "dsadas", type_id: 1, user_id: 1).save
      expect(book).to eq(false)
    end
  end
end

=end

RSpec.describe Book, type: :model do
  describe 'it should validate association ' do
    it {should belong_to(:type)}
    it {should belong_to(:user)}
  end

  describe 'it should validate presence of title ' do
    it {should validate_presence_of(:title)}
  end
end