Rails.application.routes.draw do
  root 'splash#index'

  resources :categories do
    resources :transactions
  end
end
