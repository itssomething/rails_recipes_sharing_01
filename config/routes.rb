Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :categories
    resources :users
    resources :recipes
  end
end
