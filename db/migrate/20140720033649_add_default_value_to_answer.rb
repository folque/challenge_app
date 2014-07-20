class AddDefaultValueToAnswer < ActiveRecord::Migration
  def change
    change_column :answers, :accepted, :boolean, :default => false
  end
end
