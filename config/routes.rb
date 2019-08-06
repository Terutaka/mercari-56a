Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get "profile"
    end
  end
end
