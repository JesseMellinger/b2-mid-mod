Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mechanic_id', to: 'mechanics#show'

  get '/amusementparks/:amusement_park_id', to: 'amusement_parks#show'

  post '/ride_mechanics/:mechanic_id', to: 'ride_mechanics#create'
end
