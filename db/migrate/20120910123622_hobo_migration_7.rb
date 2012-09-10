class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :steps, :position, :integer
    remove_column :steps, :list_order
  end

  def self.down
    remove_column :steps, :position
    add_column :steps, :list_order, :integer, :default => 0
  end
end
