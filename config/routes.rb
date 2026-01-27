Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "login", to: "auth#login"

      # EXEMPLO DE ROTA PROTEGIDA
      get "me", to: "users#me"
    end
  end
end
