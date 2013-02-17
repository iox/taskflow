class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    tracks_id   :integer
    description :string, :name => true
    notes       :text
    due_at      :date
    order       :integer, :default => 0
    line_order  :integer, :default => 1
    state       enum_string(:active, :completed), :default => 'active'
    completedness :integer, :default => 0
    line        :boolean, :default => false
    saved_step  :integer, :default => 0
    timestamps
  end
  
  #attr_accessible :id, :tracks_id, :description, :notes, :due_at, :order, :state, :completedness, :line
  
  has_many :steps, :order => "position asc"

  
  def short_description
    description.truncate(40, :separator => " ") if description
  end
  
  def total_steps
    array_steps = steps
    for step in array_steps
      puts step.descendants.inspect
      array_steps += step.descendants
    end
    return array_steps
  end
  
  def completed_steps
    array = []
    for step in total_steps
      array.push step if step.completed
    end
    return array
  end
  
  def step_number
    total_steps.size
  end
  
  def completed_step_number
    completed_steps.size
  end
  
  def calculate_completedness
    (100 * completed_step_number / step_number).to_i
  end

  # --- Permissions --- #

  def create_permitted?
    #acting_user.administrator?
    true
  end

  def update_permitted?
    #acting_user.administrator?
    true
  end

  def destroy_permitted?
    #acting_user.administrator?
    true
  end

  def view_permitted?(field)
    true
  end

end
