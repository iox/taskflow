class HoboMigration3 < ActiveRecord::Migration
  def self.up
    change_column :tasks, :state, :string, :limit => 255, :default => "active"
  end

  def self.down
    change_column :tasks, :state, :string
  end
end
