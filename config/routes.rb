Rails.application.routes.draw do
  root "games#new"

  resource :game do
    member do
      get :prepare
      get :employ
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
  get "players/:player_id/dices/:from/:to/change", to: "dices#change", as: "change_player_dice"

end
