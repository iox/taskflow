# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Taskflow2::Application.routes.draw do


  # Resource routes for controller tasks
  resources :tasks


  # Resource routes for controller pomodoros
  resources :pomodoros


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'


  # Resource routes for controller steps
  resources :steps do
    collection do
      post 'reorder'
    end
  end



# These are the Hobo 1.3 style routes.   They've been included for backwards
# compatibility reasons because the names of some named routes have been changed.
# Please update your views to use the new named route names and then disable this
# section by setting config.hobo.dont_emit_deprecated_routes = true.  blah blah

 
 

  # DEPRECATED Resource routes for controller tasks
  get 'tasks(.:format)' => 'tasks#index', :as => 'tasks'
  get 'tasks/new(.:format)' => 'tasks#new', :as => 'new_task'
  get 'tasks/:id/edit(.:format)' => 'tasks#edit', :as => 'edit_task'
  get 'tasks/:id(.:format)' => 'tasks#show', :as => 'task', :constraints => { :id => %r([^/.?]+) }
  post 'tasks(.:format)' => 'tasks#create', :as => 'create_task'
  put 'tasks/:id(.:format)' => 'tasks#update', :as => 'update_task', :constraints => { :id => %r([^/.?]+) }
  delete 'tasks/:id(.:format)' => 'tasks#destroy', :as => 'destroy_task', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller pomodoros
  get 'pomodoros(.:format)' => 'pomodoros#index', :as => 'pomodoros'
  get 'pomodoros/new(.:format)' => 'pomodoros#new', :as => 'new_pomodoro'
  get 'pomodoros/:id/edit(.:format)' => 'pomodoros#edit', :as => 'edit_pomodoro'
  get 'pomodoros/:id(.:format)' => 'pomodoros#show', :as => 'pomodoro', :constraints => { :id => %r([^/.?]+) }
  post 'pomodoros(.:format)' => 'pomodoros#create', :as => 'create_pomodoro'
  put 'pomodoros/:id(.:format)' => 'pomodoros#update', :as => 'update_pomodoro', :constraints => { :id => %r([^/.?]+) }
  delete 'pomodoros/:id(.:format)' => 'pomodoros#destroy', :as => 'destroy_pomodoro', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Lifecycle routes for controller users
  post 'users/signup(.:format)' => 'users#do_signup', :as => 'do_user_signup'
  get 'users/signup(.:format)' => 'users#signup', :as => 'user_signup'
  put 'users/:id/reset_password(.:format)' => 'users#do_reset_password', :as => 'do_user_reset_password'
  get 'users/:id/reset_password(.:format)' => 'users#reset_password', :as => 'user_reset_password'

  # DEPRECATED Show action routes for controller users
  get 'users/:id/account(.:format)' => 'users#account', :as => 'user_account'

  # DEPRECATED Resource routes for controller users
  get 'users/:id/edit(.:format)' => 'users#edit', :as => 'edit_user'
  get 'users/:id(.:format)' => 'users#show', :as => 'user', :constraints => { :id => %r([^/.?]+) }
  post 'users(.:format)' => 'users#create', :as => 'create_user'
  put 'users/:id(.:format)' => 'users#update', :as => 'update_user', :constraints => { :id => %r([^/.?]+) }
  delete 'users/:id(.:format)' => 'users#destroy', :as => 'destroy_user', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Reorder routes for controller steps
  post 'steps/reorder(.:format)', :as => 'reorder_steps'

  # DEPRECATED Resource routes for controller steps
  get 'steps(.:format)' => 'steps#index', :as => 'steps'
  get 'steps/new(.:format)' => 'steps#new', :as => 'new_step'
  get 'steps/:id/edit(.:format)' => 'steps#edit', :as => 'edit_step'
  get 'steps/:id(.:format)' => 'steps#show', :as => 'step', :constraints => { :id => %r([^/.?]+) }
  post 'steps(.:format)' => 'steps#create', :as => 'create_step'
  put 'steps/:id(.:format)' => 'steps#update', :as => 'update_step', :constraints => { :id => %r([^/.?]+) }
  delete 'steps/:id(.:format)' => 'steps#destroy', :as => 'destroy_step', :constraints => { :id => %r([^/.?]+) }

end
