Rails.application.routes.draw do
  get 'menus/show'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users, only: [:show, :index]
  resources :organisations
  resources :products
  resource :menu, only: [:show]
  # resources :orders, only: [:index, :create]

  scope '/days/:date' do
    resources :orders, only: [:create]
  end

  namespace 'api', defaults: { format: 'json' } do
    get '/index', action: 'index'
  end

  # resources :days, only: [:show]
  get '/days/:date', to: 'days#show'
  get 'home/index'

  root to: "home#index"
end
