# encoding: UTF-8

require 'spec_helper'

feature 'The visitor wants to log in and', :driver => :selenium do

  scenario 'Login' do
    visit '/login'
    fill_in 'login', :with => 'tecnicos@unoycero.com'
    fill_in 'password', :with => 'RobotRobot'
    click_button 'Iniciar Sesión'
    page.should have_content 'Taskflow222'
  end
  
end
