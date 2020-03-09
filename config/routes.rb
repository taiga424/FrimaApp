Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :items, only:[:show, :new, :create, :edit, :destroy] do
    member do
      get :confirm
    end
  end

  resources :users, only: [:index, :show]
  resources :items, only:[:show, :new, :create]

end
