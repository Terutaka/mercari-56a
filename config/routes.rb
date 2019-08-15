Rails.application.routes.draw do
  devise_for :users
  get 'card/new'
  get 'card/show'

  root 'items#index'

  # 今後変更予定
  resources :items do
    collection do
      get "buy"
      get "profile"
      get "mypage"
      get "personal"
      get "exhibit"
      get "new_user"
      get "login"
      get "mem_create1"
      get "mem_create2"
      get "mem_create3"
      get "mem_create4"
      get "mem_create5"
      get "show"
      get "logout"
    end
  end

  # resources :card, only: [:new, :show] do
  resources :card do
    collection do
      get "card_tmp1"
      get "card_tmp2"
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
