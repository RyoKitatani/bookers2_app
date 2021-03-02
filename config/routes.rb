Rails.application.routes.draw do
    devise_for :users
    get 'users/show'
    root to: 'homes#top'
    get "home/about" => "homes#about"
    resources :users, only: [:show, :edit, :update, :index]
    post 'follow/:id' => 'relationships#create', as: 'follow' 
    post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' 
    # resources :relationships, only: [:create, :destroy]
    resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update] do
        resources :book_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
    end
    post "/users/:id" => "books#create"
    post "/books" => "books#create"
end