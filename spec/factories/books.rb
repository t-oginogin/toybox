# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book1, class: Book do
    sequence(:title) {|i| "title#{i}"}
    sequence(:author) {|i| "author#{i}"}
    sequence(:publisher) {|i| "publisher#{i}"}
    sequence(:isbn) {|i| "111-111111111#{i}"}
  end
end
