Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    get 'sales/new', to: 'sales#new'
    post 'sales', to: 'sales#create'
  end
end
