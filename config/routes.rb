Rails.application.routes.draw do

	root 'sessions#new'

  resources :users, only:[:new, :create] 
  resources :sessions, only:[:new, :destroy, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
