class Step < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string, :required
    position :integer, :default => 0
    completed :boolean, :default => false
    timestamps
  end
  
  belongs_to :task
  
  include ActsAsTree
  acts_as_tree order: "position asc"
  set_default_order "position asc"
  acts_as_list :scope => '(task_id = \'#{task_id}\' OR parent_id = \'#{parent_id}\')'
  
  def steps
    children
  end
  
  def descendants
    all = []
    self.children.each do |category|
      all << category
      root_children = category.descendants.flatten
      all << root_children unless root_children.empty?
    end
    return all.flatten
  end
  
  before_update :update_children
  def update_children
    if completed_changed? && completed
      for child in descendants
        child.update_attribute(:completed, true)
      end
    end
  end
  
  after_save    :calculate_completedness
  after_destroy :calculate_completedness
  def calculate_completedness
    task.update_attribute(:completedness, task.calculate_completedness)
  end
  
  def task
    Task.find(root.task_id)
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

  # attr_accessible :title, :body
end
