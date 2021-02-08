Rails.application.routes.draw do
  get 'users/show'
    devise_for :users
    root to: 'homes#top'
    get "homes/about" => "homes#about"
    resources :books, only: [:create, :new, :index, :show, :destroy]
    resources :users, only: [:show, :edit, :update]
end