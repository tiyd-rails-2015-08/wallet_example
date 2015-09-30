class AddAmountToExchange < ActiveRecord::Migration
  def change
    add_column :exchanges, :amount, :decimal
  end
end
