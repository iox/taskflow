class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    if Task.where(:id => params[:id]).count > 0
      @task = Task.find(params[:id])
      
      # Complete a task
      if params[:completed]
        @task.update_attribute(:state, 'completed')
        @task = Task.where(:state => 'active').first
      end
    else
      # Handle new tasks (id 999999)
      @task = Task.create(:description => "")
    end
    
    # Handle saved steps
    if params[:clear_saved_step]
      @task.update_attribute(:saved_step, 0)
    end
    if @task.saved_step > 0
      params[:step] = @task.saved_step
    end
    
    # Handle steps
    @current = @task
    if params[:step]
      @step = Step.find(params[:step])
      @task.update_attribute(:saved_step, @step.id)
      @current = @step
    end

    hobo_show
  end

end
