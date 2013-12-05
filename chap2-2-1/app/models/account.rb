class Account < ActiveRecord::Base
  attr_accessible(
    :bs_pl_division,
    :debit_credit_division,    
    :code,
    :name,
    :parent_code
    )
  belongs_to :account
  has_many :account

  validates_presence_of(
    :bs_pl_division,
    :debit_credit_division,
    :code,
    :name
    )
  
end
