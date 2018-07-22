Rails.application.routes.draw do
  root "game#new"

  resource :game do
    member do
      get :prepare
      get :march
    end
  end

  resources :players do
    resources :dices do
      member do
        get :move
      end
    end
  end

end
