class AddSlidesToUser < ActiveRecord::Migration
  def self.up
    add_column :slides, :user_id, :integer
  end

  def self.down
    remove_column :slides, :user_id
  end
end
