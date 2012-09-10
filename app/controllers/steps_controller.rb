class StepsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def create
    hobo_create do
      # Level 0
      if @step.task_id
        @task = @step.task
        @current = @task
        @step = nil
      # Level 1
      else
        @task = @step.ancestors.last.task
        @current = @step.parent
        @step = @step.parent
      end
    end
  end
  
  def destroy
    @step = Step.find(params[:id]).destroy
    render :text => "$('##{dom_id(@step)}').remove();"
  end
  
  def update
    hobo_update do
      render :text => "$('.bar').width('#{@step.task.completedness}%')"
    end
  end

end
