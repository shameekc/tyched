class CreateWishes < ActiveRecord::Migration
  def self.up
    create_table :wishes do |t|
      t.string :content
      t.integer :user_id
      t.date :expiry
      t.string :status
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :wishes
  end
end
