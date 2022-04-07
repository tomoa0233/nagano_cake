Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :customers, controllers: {
   registrations: "public/registrations",
   passwords: "public/passwords",
   sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
   sessions: "admin/devise/sessions",
   passwords: "admin/devise/passwords",
   registrations: "admin/devise/passwords"
  }

  root to: 'admin/homes#top'

  namespace :admin do
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:create, :new, :index, :show, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
  end
end
