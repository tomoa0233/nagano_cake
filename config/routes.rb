Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# devise_for :customers,skip: [:passwords], controllers: {
#   registrations: "public/registrations",
#   sessions: 'public/sessions'
# }

# devise_for :admin, skip: [:registrations, :passwords], controllers: {
#   sessions: "admin/sessions"
# }

end
