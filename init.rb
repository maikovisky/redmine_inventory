Redmine::Plugin.register :inventory do
  name 'Inventory plugin'
  author 'Maiko de Andrade'
  description 'This is a plugin for control of equipaments'
  version '0.0.3'
  url 'http://maxbrasil.net.br'
  author_url 'http://maikovisky.com'

  project_module :inventory do
  	permission :view_inventory,  {
		:inventories => [:index, :show, :print], 
		:inventory_types => [:index, :show],
		:inventory_locates => [:index, :show],
		:inventory_brands => [:index, :show]
	}
  	permission :manage_inventory, {
		:inventories => [:destroy, :update, :create, :edit, :new, :index, :show, :print],
		:inventory_types => [:destroy, :update, :create, :edit, :new, :index, :show],
		:inventory_locates => [:destroy, :update, :create, :edit, :new, :index, :show],
		:inventory_brands => [:destroy, :update, :create, :edit, :new, :index, :show],
	}
  	permission :allow_inventory_check_ins, {
		:inventory_check_ins => [ :new, :create, :loclist ]
	}


  menu :top_menu, "Inventory",
    { :controller => 'inventories', :action => 'index' },
      :caption => :inventory_label, :after => :projects,
      :if => Proc.new {
        User.current.allowed_to?(:view_inventory, nil, :global => true)
      }
	end

end
