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

end
