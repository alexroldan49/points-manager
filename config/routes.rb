Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only:[:index, :create, :update, :show]
  resources :transactions, only:[:index, :create, :show]

  get "/balances/:id", to: "users#payer_balances"
  
end
