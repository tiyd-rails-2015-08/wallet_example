class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.decimal :withdrawal
      t.decimal :deposit
      t.string :collecter
      
      t.timestamps null: false
    end
  end
end
