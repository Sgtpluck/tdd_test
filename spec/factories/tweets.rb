# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    body "MyString"
    author "MyString"
  end

  factory :tweet2, class: Tweet do
    body "MyString2"
    author "MyString2"
  end
end
