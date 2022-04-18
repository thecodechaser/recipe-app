Rails.application.routes.draw do
  devise_for :users
  resources :foods, only: [:index, :new, :create, :destroy]

  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  
  resources :public_recipes, only: [:index]

  resources :shopping_list, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home_page#index"

  # api routes

  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      post 'users/sign_up' => 'users#register'
      post 'users/sign_in' => 'users#login'
    end
  end

end
