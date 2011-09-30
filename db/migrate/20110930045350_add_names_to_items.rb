class AddNamesToItems < ActiveRecord::Migration
  def self.up
    add_column :slides, :name, :string
	add_column :whiteboards, :name, :string
  end

  def self.down
    remove_column :slides, :name
	remove_column :whiteboards, :name
  end
end
