Rails.application.routes.draw do
  root "game#edit"
  resource :game do
    member do
      get :prepare
      get :march
    end
  end
end
