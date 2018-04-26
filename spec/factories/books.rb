FactoryGirl.define do
  factory :book do
    title Faker::Book.title
    content Faker::Lorem.paragraph(3)
    author Faker::Book.author
    isbn Faker::Number.number(10)
    user
    type
    book_image "GameOfThrones1.jpg"
  end
end
