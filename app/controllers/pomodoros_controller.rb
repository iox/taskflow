class PomodorosController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  def create
    hobo_create do
      redirect_to '/'
    end
  end
  
  def index
    hobo_index Pomodoro.apply_scopes(
      :created_between => [Time.now.beginning_of_day, Time.now.end_of_day]
    )
  end

end
