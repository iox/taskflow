class HoboMigration8 < ActiveRecord::Migration
  def self.up
    add_column :tasks, :saved_step, :integer, :default => 0
  end

  def self.down
    remove_column :tasks, :saved_step
  end
end
