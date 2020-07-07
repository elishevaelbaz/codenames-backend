Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :words, only: [:index]
  resources :games, only: [:index, :create]
  resources :game_words, only: [:index]

end
