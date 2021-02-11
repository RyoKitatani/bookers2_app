Rails.application.routes.draw do
    devise_for :users
    get 'users/show'
    root to: 'homes#top'
    get "home/about" => "homes#about"
    resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update]
    resources :users, only: [:show, :edit, :update, :index]
    post "/users/:id" => "books#create"
    post "/books" => "books#create"
end