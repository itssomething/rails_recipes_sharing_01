Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :categories
    resources :users
    get "/signup", to: "users#new"
    resources :recipes
  end
end
