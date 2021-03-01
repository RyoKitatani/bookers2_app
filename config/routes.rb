Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
    devise_for :users
    get 'users/show'
    root to: 'homes#top'
    get "home/about" => "homes#about"
    resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update] do
        resource :book_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :index]
    post "/users/:id" => "books#create"
    post "/books" => "books#create"
end