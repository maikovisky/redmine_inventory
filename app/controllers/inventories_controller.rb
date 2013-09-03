class InventoriesController < ApplicationController

  def show 
    @inventory = Inventory.find(params[:id], :joins => [:inventory_brand, :inventory_type])
  end

  def index
	@inventories = Inventory.find(:all, :order => "name asc", :joins=> [:inventory_type, :inventory_brand]);
	@total_consumption = Inventory.sum('consumption')
	@total_price = Inventory.sum('price')
  end

  def new
	@inventory = Inventory.new
	@inventory_type = InventoryType.find(:all, :order => "name asc");
	@inventory_brand = InventoryBrand.find(:all, :order => "name asc");
  end

  def create
	@inventory = Inventory.new(params[:inventory])
	if @inventory.save
        flash[:notice] = l(:label_inventory_created, :title => @inventory.name)
		redirect_to({:action => 'index'})
	else
		render(:action => 'new')
	end
  end

  def edit
    @inventory = Inventory.find(params[:id])
	@inventory_type = InventoryType.find(:all, :order => "name asc");
	@inventory_brand = InventoryBrand.find(:all, :order => "name asc");
  end

  def destroy
	Inventory.find(params[:id]).destroy
	flash[:notice] = l(:label_inventory_destroy)
	redirect_to({:action => 'index'})
  end

  def update
    @inventory = Inventory.find(params[:id])
    @inventory.update_attributes(params[:inventory])
    if @inventory.save
		flash[:notice] = l(:notice_successful_update)
		redirect_to({:action=>'index'})
	end
  end
end
