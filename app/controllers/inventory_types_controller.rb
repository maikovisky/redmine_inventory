class InventoryTypesController < ApplicationController
  unloadable

  def show 
    @inventory_type = InventoryType.find(params[:id])
  end

  def index
	@inventory_type = InventoryType.find(:all, :order => "name asc")
  end

  def new
	@inventory_type = InventoryType.new
  end

  def create
	@inventory_type = InventoryType.new(params[:inventory_type])
	if @inventory_type.valid?
	  if @inventory_type.save
          flash[:notice] = l(:label_inventory_type_created, :title => @inventory_type.name)
		  redirect_to({:action => 'show', :id =>@inventory_type.id})
	  end
    else 
		flash[:error] = l(:notice_error_new)
  		flash[:error] << "<ul>"
    	@inventory_type.errors.full_messages.each do |msg|
  		  flash[:error] << "<li>" + msg + "</li>"
        end
  		flash[:error] << "</ul>"
		render :new
	end
  end

  def edit
    @inventory_type = InventoryType.find(params[:id])
  end

  def destroy
	InventoryType.find(params[:id]).destroy
	flash[:notice] = l(:label_inventory_type_destroy)
	redirect_to({:action => 'index'})
  end

  def update
    @inventory_type = InventoryType.find(params[:id])
    @inventory_type.update_attributes(params[:inventory_type])
	if @inventory_type.valid?
    	if @inventory_type.save
			flash[:notice] = l(:notice_successful_update)
			redirect_to({:action=>'index'})
		end
	else
		flash[:error] = l(:notice_error_update)
  		flash[:error] << "<ul>"
    	@inventory_type.errors.full_messages.each do |msg|
  		  flash[:error] << "<li>" + msg + "</li>"
        end
  		flash[:error] << "</ul>"
		render :edit
	end
  end
end
