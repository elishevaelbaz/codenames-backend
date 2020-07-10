Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :words, only: [:index]
  resources :games, only: [:index, :create, :update, :destroy]
  resources :game_words, only: [:index, :update]


  get '/games/:room_code', to: 'games#code_lookup', as: 'code_lookup'
  post '/games/:room_code', to: 'games#new_round', as: 'new_round'

  mount ActionCable.server => '/cable'
  
end
