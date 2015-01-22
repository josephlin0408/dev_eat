Rails.application.routes.draw do
  devise_for :users
	root 'stores#index'
	namespace :mystores do
		resources :products
	end
	
	resources :stores do
		member do
			get :take
		end
	end

	namespace :superadmin do
		root 'stores#index'
		resources :stores
		resources :store_categories
		resources :store_products
	end
end