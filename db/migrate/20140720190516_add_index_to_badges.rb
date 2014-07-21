class AddIndexToBadges < ActiveRecord::Migration
  def change
    add_index :badges, :user_id
  end
end
