Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "connect4_game#home"

  get "/connect4_game", to: "connect4_game#play"
  get "/connect4_game/play", to: "connect4_game#bye"
end
