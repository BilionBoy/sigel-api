Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :g_veiculos
    end
  end
  namespace :api do
    namespace :v1 do
      post "login", to: "auth#login"
      get "me",     to: "users#me"

      resources :g_tipos_veiculos
    end
  end
end
