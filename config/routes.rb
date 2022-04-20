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

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  namespace :public do
   delete 'cart_items/empty' => 'cart_items#empty'

   post 'orders' => 'orders#confirm'
   get 'orders/thanks' => 'orders#thanks'
   post 'orders/orderend' => 'orders#orderend'

   get 'customers/my_page' => 'customers#show' , as: "customers/my_page"
   get 'customers/unsubscribe' => 'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'

   resources :items, only: [:index, :show]
   resources :addresses, except: [:new, :show]
   resources :cart_items, except: [:new, :show, :edit]
   resources :orders, only: [:new, :index, :show, :update]
   resources :customers, only: [:edit, :update]
  end

  namespace :admin do
   get '/' => 'homes#top'
   patch 'order_details/:id' => 'order_details#update'


   resources  :orders, only: [:show]
   resources :genres, except: [:new, :delete, :show]
   resources :items, except: [:delete]
   resources :customers, except: [:new, :delete, :create]
  end
end
