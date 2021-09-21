Rails.application.routes.draw do
  namespace :api do
    resources :currencies, only: %i[index]
    get 'currencies/:code', to: 'currencies#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
