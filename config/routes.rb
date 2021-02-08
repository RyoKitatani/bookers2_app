Rails.application.routes.draw do
    devise_for :users
    root to: 'homes#top'
    get "homes/about" => "homes#about"
    resources :books, only: [:create, :new, :index, :show, :destroy]
end