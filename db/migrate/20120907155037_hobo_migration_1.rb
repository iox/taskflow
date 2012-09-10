class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer  :tracks_id
      t.string   :description
      t.text     :notes
      t.date     :due_at
      t.integer  :order, :default => 0
      t.integer  :line_order, :default => 1
      t.string   :state
      t.boolean  :line, :default => false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :tasks
  end
end
