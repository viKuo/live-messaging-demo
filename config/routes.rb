Rails.application.routes.draw do

	root 'chats#index'

  resources :users, only:[:new, :create] do
  	resources :chats, only:[:index, :create, :show]
  end 
  resources :sessions, only:[:new, :destroy, :create]
	resources :messages, only:[:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
