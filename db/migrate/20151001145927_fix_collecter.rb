class FixCollecter < ActiveRecord::Migration
  def change
    rename_column :exchanges, :collecter, :collector
  end
end
