Rails.application.routes.draw do

	root 'sessions#new'
	
  resources :users, except:[:show, :edit, :update] 
  resources :sessions, only:[:new, :destroy, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
