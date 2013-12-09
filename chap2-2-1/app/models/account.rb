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

  def self.import(file)
    case File.extname(file.original_filename)
      when '.csv' then
      CSV.foreach(file.path, headers: true, encoding: "SJIS:UTF-8") do |row|
        account = find_by_id(row["id"]) || new
        account.attributes = row.to_hash.slice(*accessible_attributes)
        account.save!
      end
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
