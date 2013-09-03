class InventoryLocatesController < ApplicationController
  unloadable


  def new
	@inventory_locate = InventoryLocate.new
  end

  def edit
	@inventory_locate = InventoryLocate.find(params[:id]);
  end

  def index
	@inventory_locate = InventoryLocate.find(:all);
  end

  def create
	@inventory_locate = InventoryLocate.new(params[:inventory_locate])
	if @inventory_locate.save
        flash[:notice] = l(:label_inventory_locate_created, :title => @inventory_locate.name)
		redirect_to({:action => 'index'})
	else
		render(:action => 'new')
    end
  end

  def update
  end

  def show
	@inventory_locate = InventoryLocate.find(params[:id]);
  end

  def destroy
    InventoryLocate.find(params[:id]).destroy
    flash[:notice] = l(:label_inventory_locate_destroy)
    redirect_to({:action=>'index'})
  end
end
