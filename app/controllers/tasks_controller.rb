class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def show
    # Compelte the Task before the pomodoro checks
    if params[:completed]
      Task.find(params[:id]).update_attribute(:state, 'completed')
    end
    if pomodoro = Pomodoro.state_is('active').last
      @minutos_pomodoro = 25 - ((Time.now - pomodoro.created_at) / 60).round
      if @minutos_pomodoro < 1
        pomodoro.update_attribute(:state, 'completed')
      end
    end
    if Pomodoro.state_is('active').count > 0
      if params[:id] && Task.where(:id => params[:id]).count > 0
        @task = Task.find(params[:id])
        # If the task is completed, set the current task to another one
        if params[:completed]
          @task = Task.where(:state => 'active').first
        end
      else
        @task = Task.create(:description => "")
      end
      
      # Add the task to the pomodoro record
      unless pomodoro.tasks.include? @task
        pomodoro.tasks << @task
        pomodoro.save!
      end
      
      # Handle saved steps
      if params[:clear_saved_step] || params[:step]
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
    else
      # Handle new tasks (id 999999)
      redirect_to '/pomodoros/new'
    end
  end

end
