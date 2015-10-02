class AddPhoneNumber < ActiveRecord::Migration
  def change
    add_column :exchanges, :phone_number, :integer
  end
end
