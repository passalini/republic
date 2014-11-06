Rails.application.routes.draw do
  resources :group_bills
  get 'fraternities/index'

  root to: 'fraternities#index'
end
