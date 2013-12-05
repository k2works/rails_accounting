class Account < ActiveRecord::Base
  attr_accessible(
    :bs_pl_division,
    :code,
    :debit_credit_division,
    :name,
    :parent_code
    )
  belongs_to :account
  has_many :account
end
