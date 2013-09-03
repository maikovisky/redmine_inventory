class InventoryCheckinsController < ApplicationController

  def new
	@inventory_checkin = InventoryCheckin.new
	@inventory_locate = InventoryLocate.find(:all, :order => "name asc")
	@inventory = Inventory.find(params[:inventory_id])
    @user = User.find(:all, :order => "firstname asc, lastname asc")
    @inventory_checkin.user_id = session[:user_id] 
    @inventory_checkin.inventory_id = params[:inventory_id]
  end

  def create
	@inventory_checkin = InventoryCheckin.new(params[:inventory_checkin])
	@inventory_checkin.create_at = DateTime.current
	if @inventory_checkin.save
        flash[:notice] = l(:label_inventory_created)
		redirect_to({:action => 'index'})
	else
		render(:action => 'new')
	end
  end

  def index
  end

  def show
  end
end
