class HoboMigration9 < ActiveRecord::Migration
  def self.up
    create_table :pomodoros do |t|
      t.string   :state, :default => "active"
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :pomodoro_tasks do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :task_id
      t.integer  :pomodoro_id
    end
    add_index :pomodoro_tasks, [:task_id]
    add_index :pomodoro_tasks, [:pomodoro_id]
  end

  def self.down
    drop_table :pomodoros
    drop_table :pomodoro_tasks
  end
end
