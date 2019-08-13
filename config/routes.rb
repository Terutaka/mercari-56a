Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  root 'items#index'

  # 今後変更予定
  resources :items do
    collection do
      get "buy"
      get "profile"
      get "mypage"
      get "exhibit"
      get "new_user"
      get "login"
      get "come_user"
      get "complete"
      get "registration"
      get "telephone_number"
      get "street_address"
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
