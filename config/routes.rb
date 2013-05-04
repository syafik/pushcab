Pushcab::Application.routes.draw do

  devise_for :cabs

  resources :taxi_requests, except: :new

  devise_for :users

  # drivers routes
  match "/drivers/sign_in" => "driver/session#new", :as => :driver_sign_in
  match "/drivers/create" => "driver/session#create", :as => :create_driver_sign_in, via: :post
  match "/drivers/delete" => "driver/session#delete", :as => :driver_log_out, via: :delete

  match "/my_requests" => "taxi_requests#user_request", :as => :my_requests
  match "/taxi_requests/:driver_id/new" => "taxi_requests#new", :as => :new_taxi_request, via: :post

  root :to => 'home#index'
end
