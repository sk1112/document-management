Rails.application.routes.draw do
  devise_for :user
  root "documents#index"
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :documents do
    collection do
      get :search
    end
  end
end
