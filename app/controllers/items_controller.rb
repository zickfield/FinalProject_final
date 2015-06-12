class ItemsController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:update, :destroy, :show, :edit]

  def ensure_current_user_is_owner
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_url, :alert => "Nice try"
    end
  end


  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.user_id = current_user.id
    @item.name = params[:name]
    @item.description = params[:description]
    @item.price = params[:price]
	@item.image_url = params[:image_url]

    if @item.save
      redirect_to "/items", :notice => "Item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.name = params[:name]
    @item.description = params[:description]
    @item.price = params[:price]
	@item.image_url = params[:image_url]

    if @item.save
      redirect_to "/items", :notice => "Item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
	if Reservation.exists?(item_id: @item.id)
	  @reservation = Reservation.find_by(item_id: @item.id)
      @reservation.destroy
	end
    @item.destroy

    redirect_to "/items", :notice => "Item deleted."
  end
end
