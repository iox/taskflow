class StepsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def create
    @step = Step.create(params[:step])
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
#        ajax_update_response(
#          params[:render].values, {}, 
#          {:postamble => "
#            $('.bar').width('#{@task.completedness}%') 
#          "})
#    end
  end
  
  def destroy
    @step = Step.find(params[:id]).destroy
    render :text => "$('##{dom_id(@step)}').remove();
                     $('.bar').width('#{@step.task.completedness}%');"
  end
  
  def update
    hobo_update do
      render :text => "$('.bar').width('#{@step.task.completedness}%')"
    end
  end
  
  def move
    @step = Step.find(params[:id])
    if params[:direction] == 'up'
      @step.move_higher
    elsif params[:direction] == 'down'
      @step.move_lower
    end
    logger.info '>>> Moving finished'
    @task = @step.task
    if @step.task_id
      @current = @task 
      @moved = @step
      @step = nil
    else
      @current = @step.parent
      @moved = @step
      @step = @step.parent
    end
    
  end

end
