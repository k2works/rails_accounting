# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    bs_pl_division "MyString"
    debit_credit_division "MyString"
    code "MyString"
    name "MyString"
    parent_code "MyString"
  end
end
