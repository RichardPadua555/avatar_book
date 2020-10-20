Rails.application.routes.draw do
	
	root 'pages#index'	
  devise_for :users
  resources :client_users  
end
