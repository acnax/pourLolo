Rails.application.routes.draw do
 
  root to: 'gossips#index'

	get '/team', to: 'static_pages#team', as: 'team'

	get '/contact', to: 'static_pages#contact', as: 'contact'

	resources :gossips do
		resources :comments
	end

	resources :users

	resources :cities

	resources :sessions, only: [:new, :create, :destroy]

	#get '/welcome(/:first_name)', to: "dynamic_pages#welcome", as: 'welcome'

	#get '/gossip/:gossip_id', to: "dynamic_pages#show", as: 'show'

	#get '/user/:user_id', to: "dynamic_pages#show_user", as: 'show_user'


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
