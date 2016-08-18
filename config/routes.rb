Rails.application.routes.draw do

	root 'chats#index'

  resources :users, only:[:new, :create] do
  	resources :chats, only:[:index, :create, :show]
  end 
  resources :sessions, only:[:new, :destroy, :create]
	resources :messages, only:[:create]

    # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
