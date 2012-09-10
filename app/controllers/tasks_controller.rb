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
    
    # Handle steps
    @step = Step.find(params[:step]) if params[:step]
    @current = @task
    @current = @step if @step

    hobo_show
  end

end
