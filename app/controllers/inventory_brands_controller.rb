class InventoryBrandsController < ApplicationController

  def show 
    @inventory_brand = InventoryBrand.find(params[:id])
  end

  def index
	@inventory_brand = InventoryBrand.find(:all, :order => "name asc")
  end

  def new
	@inventory_brand = InventoryBrand.new
  end

  def create
	@inventory_brand = InventoryBrand.new(params[:inventory_brand])
	if @inventory_brand.save
        flash[:notice] = l(:label_inventory_brand_created, :title => @inventory_brand.name)
		redirect_to({:action => 'index'})
	else
		render(:action => 'new')
	end
  end

  def edit
    @inventory_brand = InventoryBrand.find(params[:id])
  end

  def destroy
	InventoryBrand.find(params[:id]).destroy
	flash[:notice] = l(:label_inventory_brand_destroy)
	redirect_to({:action => 'index'})
  end

  def update
    @inventory_brand= params[:inventory_brand]
    if @inventory_brand.save
		flash[:notice] = l(:notice_successful_update)
		redirect_to({:action=>'index'})
	end
  end
end
