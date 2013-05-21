Pushcab::Application.routes.draw do

  devise_for :cabs
  devise_for :users

  resources :taxi_requests, except: :new
  resources :cabs

  resources :taxi_requests, except: :new  do
    post 'response_request'
  end

  match "/my_requests" => "taxi_requests#user_request", :as => :my_requests
  match "/taxi_requests/:cab_id/new" => "taxi_requests#new", :as => :new_taxi_request, via: :post

  root :to => 'home#index'
end
