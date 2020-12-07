Rails.application.routes.draw do
  devise_for :user
  resources :users
  root "documents#index"
  resources :documents do
    collection do
      get :search
    end
  end
end
