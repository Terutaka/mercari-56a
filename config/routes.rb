Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  root 'items#index'

  # 今後変更予定
  resources :items do
    collection do
      get "profile"
      get "mypage"
      get "exhibit"
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
