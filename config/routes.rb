Rails.application.routes.draw do
  devise_for :users
  get 'card/new'
  get 'card/show'

  root 'items#index'

  resources :items do
    collection do
      get "buy"
      get "profile"
      get "mypage"
      get "item_edit"
      get "editing_screen"
      get "personal"
      get "exhibit"
      get "new_user"
      get "login"
      get "mem_create1"
      get "mem_create2"
      get "mem_create3"
      get "mem_create4"
      get "mem_create5"
      get "logout"
      get "select",default: {format: 'json'}
    end
  end

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
