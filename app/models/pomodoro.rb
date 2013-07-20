class Pomodoro < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    state       enum_string(:active, :completed, :cancelled), :default => 'active'
    timestamps
  end
  attr_accessible :state
  
  has_many :pomodoro_tasks
  has_many :tasks, :through => :pomodoro_tasks
  
  after_create :touch_semaforo
  def touch_semaforo
    require 'fileutils'
    FileUtils.touch('tmp/pomodoro.txt')
  end
  
  def name
    if tasks.size > 0
      tasks.*.description.to_sentence
    else
      "Pomodoro #{id}"
    end
  end

  # --- Permissions --- #

  def create_permitted?
    true
  end

  def update_permitted?
    true
  end

  def destroy_permitted?
    true
  end

  def view_permitted?(field)
    true
  end

end
