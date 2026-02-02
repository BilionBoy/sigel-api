Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "login", to: "auth#login"
      get "me",     to: "users#me"

      resources :g_veiculos
      resources :g_leiloes
      resources :g_tipos_veiculos
    end
  end
end
