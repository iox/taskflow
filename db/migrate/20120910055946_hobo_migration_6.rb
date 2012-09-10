class HoboMigration6 < ActiveRecord::Migration
  def self.up
    rename_column :steps, :order, :list_order
  end

  def self.down
    rename_column :steps, :list_order, :order
  end
end
