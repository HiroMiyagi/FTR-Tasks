Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  resources :projects, only: [:new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create, :show, :edit, :update, :destroy] do
      put :sort
    end
  end

end
