Rails.application.routes.draw do
  devise_for :users
	root 'stores#index'
	resources :stores
	namespace :superadmin do
		root 'stores#index'
		resources :stores
		resources :store_categories
		resources :store_products
	end	
end
