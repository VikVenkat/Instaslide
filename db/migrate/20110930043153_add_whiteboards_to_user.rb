class AddWhiteboardsToUser < ActiveRecord::Migration
  def self.up
    add_column :whiteboards, :user_id, :integer
  end

  def self.down
    remove_column :whiteboards, :user_id
  end
end
