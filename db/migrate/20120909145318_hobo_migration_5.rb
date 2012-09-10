class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :tasks, :completedness, :integer, :default => 0
  end

  def self.down
    remove_column :tasks, :completedness
  end
end
