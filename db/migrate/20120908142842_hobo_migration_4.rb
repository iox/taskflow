class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :steps, :order, :integer, :default => 0
    add_column :steps, :parent_id, :integer

    add_index :steps, [:parent_id]
  end

  def self.down
    remove_column :steps, :order
    remove_column :steps, :parent_id

    remove_index :steps, :name => :index_steps_on_parent_id rescue ActiveRecord::StatementInvalid
  end
end
