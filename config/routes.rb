Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "home#index"

  resources :faculties,:students

  get "/signin" => "sessions#new" ,as: :new_sessions
  post "/signin" => "sessions#create" , as: :sessions
  get "/show"  => "sessions#show", as: :show_sessions

end
