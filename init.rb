Redmine::Plugin.register :inventory do
  name 'Inventory plugin'
  author 'Maiko de Andrade'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://maxbrasil.net.br'
  author_url 'http://maikovisky.com'

  permission :view_inventory,  {
								:inventory => [:index, :show, :print], 
								:inventory_types => [:index, :show]
								}
  permission :manage_inventory, {:inventory => [:destroy, :update, :create, :edit, :new]}
  permission :allow_inventory_check_ins, {:inventory_check_ins => [ :new, :create, :loclist ]}


  menu :top_menu, "Inventory",
    { :controller => 'inventories', :action => 'index' },
      :caption => :inventory_label, :after => :projects
	
#    :if => Proc.new {
#      User.current.allowed_to?(:view_inventory, nil, :global => true)
#  }


end
