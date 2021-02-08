Rails.application.routes.draw do
  get 'users/show'
    devise_for :users
    root to: 'homes#top'
    get "homes/about" => "homes#about"
    resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update]
    resources :users, only: [:show, :edit, :update]
    post "/users/:id" => "books#create"
end