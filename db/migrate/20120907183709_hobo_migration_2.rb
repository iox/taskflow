class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.string   :name
      t.boolean  :completed, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :task_id
    end
    add_index :steps, [:task_id]
  end

  def self.down
    drop_table :steps
  end
end
