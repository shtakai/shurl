Rails.application.routes.draw do
  root 'pages#index'
  get '/:short_url', to: 'urls#redirect', as: 'short_url'

  resources :urls, only: %i[index create show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
