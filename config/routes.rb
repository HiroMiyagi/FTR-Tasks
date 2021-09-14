Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'

  resources :projects, only: [:new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create, :show, :edit, :update, :destroy] do
      put :sort
    end
  end

  resources :groups, only: [:index, :new, :create, :show, :destroy]

end
