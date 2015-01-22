Rails.application.routes.draw do
  devise_for :users
	root 'stores#index'
	#前端
	resources :stores do
		member do
			get :take
		end
	end
	#商家端
	namespace :mystore do
		root 'settings#index'
		resources :categories
		resources :products
		resources :settings
	end
	#站方管理員
	namespace :superadmin do
		root 'stores#index'
		resources :stores
		resources :store_categories
		resources :store_products
	end
end