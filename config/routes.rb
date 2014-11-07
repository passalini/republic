Rails.application.routes.draw do
  get 'fraternities/index'

  root to: 'fraternities#index'
end
