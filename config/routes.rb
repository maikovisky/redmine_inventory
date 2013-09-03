# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do
#  match 'inventory', :to => 'inventories#index'
#  match 'inventory/:id', :to => 'inventories#show', :via => "get"
#  match 'inventory/:action/:id', :to => 'inventories#show'
#  match 'inventory_types/new', :to => 'inventory_types#new'

  resources :inventories 
#  resources :inventories, :to => 'inventory'
  resources :inventory_types
  resources :inventory_brands
  resources :inventory_locates 
  resources :inventory_checkins 
end

