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

  def self.to_csv(options = {})
    csv_data = CSV.generate(options) do |csv|
      csv << column_names
      all.each do |account|
        csv << account.attributes.values_at(*column_names)
      end
    end

    csv_data = csv_data.tosjis
  end
end
