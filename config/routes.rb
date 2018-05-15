Rails.application.routes.draw do
  get 'clubs/index', to: 'clubs#index', as: 'club'
  root to: 'staticpages#home'
  devise_for :users
  get 'users/:id', to: 'users#show', as: 'show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
