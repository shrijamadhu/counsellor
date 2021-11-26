Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "home#index"
  get "/admin" =>"home#new"

  resources :faculties,:students
  get "/signin" => "sessions#new" ,as: :new_sessions
  post "/signin" => "sessions#create" , as: :sessions
  get "/session" => "sessions#index" ,as: :session
  get "/sessions/show" => "sessions#show",as: :show_sessions
  put "/sessions/update" =>"sessions#update", as: :sessions_path

  get "/faculties/show"  => "faculties#show", as: :show_faculties
  get "/students/show" => "students#show", as: :show_students

  put "/faculties/update" => "faculties#update", as: :faculty_path
  put "/students/update" => "students#update", as: :student_path
  delete "/signout" =>"sessions#destroy" , as: :destroy_session
end
