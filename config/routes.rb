Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :customers, skip: [:passwords], controllers: {
   registrations: "public/registrations",
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
  end
end
