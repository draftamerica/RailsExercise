Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "users#home"
  post "/new_user_post" => "users#new_user_post"
  resources :users do
      resources :posts
  end
end
