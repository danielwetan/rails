Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :v1 do 
    resources :posts
    resources :users
    post 'users/login' => 'users#login'
    post 'users/register' => 'users#register'
  end
end
