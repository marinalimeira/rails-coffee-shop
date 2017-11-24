Rails.application.routes.draw do
  resources :products do
    get 'purchase', to: 'purchases#new', as: :new_purchase
    post 'purchase', to: 'purchases#create', as: :create_purchase
  end
end
