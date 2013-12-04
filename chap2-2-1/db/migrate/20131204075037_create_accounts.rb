class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :bs_pl_division
      t.string :debit_credit_division
      t.string :code
      t.string :name
      t.string :parent_code

      t.timestamps
    end
  end
end
