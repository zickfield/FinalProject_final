class ListsController < ApplicationController

  skip_before_action :authenticate_user!
  
  def index
    @lists = Item.all
  end

  def book
    authenticate_user!
    @item = Item.find(params[:id])
	@reservation = Reservation.find_by(item_id: @item.id)
	if Reservation.exists?(item_id: @item.id)
      #cannot buy
	  redirect_to "/lists", :notice => "Item not available."
	else
	  @reservation = Reservation.new
      @reservation.user_id = current_user.id
	  @reservation.item_id = @item.id
	  @reservation.active = 0
	  @reservation.save
      redirect_to "/reservations", :notice => "Reservation created successfully."
    end
  end
end
