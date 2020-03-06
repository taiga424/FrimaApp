Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only:[:show, :new, :create] do
    member do
      get :confirm
    end
  end
end
