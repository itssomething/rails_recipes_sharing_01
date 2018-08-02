Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/feed", to: "feeds#index"
    get "/search", to: "search#index"
    get "/topuser", to: "users#index"

    resources :categories
    resources :users
    resources :recipes do
      resources :comments, only: [:create, :destroy]
    end
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
  end
end
