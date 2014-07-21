class CreateRewardings < ActiveRecord::Migration
  def change
    create_table :rewardings do |t|
      t.integer :badge_id
      t.integer :user_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
