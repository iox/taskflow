class FrontController < ApplicationController

  hobo_controller

  def index
    redirect_to (Task.where(:state => 'active').first || '/tasks/999999')
  end

  def summary
    if !current_user.administrator?
      redirect_to user_login_path
    end
  end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end
  
  def tracks
    @tareas = []
    @pings = []
    Todo.find(:all, :from => "/todos.xml?due=0").map{|t|
      if t.tags && (t.tags.include?('ibon') || t.tags.include?('imanol'))
      elsif t.tags && t.tags.include?('starred')
        @pings << t
      else
        @tareas << t
      end
    }
  end
  
  def new_task_from_tracks
    todo = Todo.find(params[:id])
    @task = Task.create(:description => todo.description, :notes => todo.notes)
    redirect_to @task
  end

end
