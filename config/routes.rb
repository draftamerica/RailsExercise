Rails.application.routes.draw do
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "users#home"
  post "/new_user_post" => "posts#create"
  get "/login_form" => "users#login_form"
  post "/login" => "users#login"
  get "/logout" => "users#logout"
  get "/home" => "users#home"
  get "/comments" => "users#posts"

  resources :users do
      resources :posts
      resources :addresses
  end
end
