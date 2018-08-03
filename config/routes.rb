Rails.application.routes.draw do
  resources :users
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
  end
end
