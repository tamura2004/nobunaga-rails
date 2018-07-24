Rails.application.routes.draw do
  root "games#new"

  resource :game do
    member do
      get :prepare
      # get :march
    end
  end

  resources :players do
    member do
      get :march
    end
    resources :dices do
      member do
        get :move
      end
    end
  end

end
