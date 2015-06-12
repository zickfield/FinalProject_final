class ReservationsController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:update, :destroy, :show, :edit]

  def ensure_current_user_is_owner
    @reservation = Reservation.find(params[:id])
    if @reservation.user_id != current_user.id
      redirect_to root_url, :alert => "Nice try"
    end
  end


  def index
    @reservations = current_user.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
    @reservation.user_id = current_user.id
    @reservation.name = params[:name]
    @reservation.description = params[:description]
    @reservation.price = params[:price]
	@reservation.image_url = params[:image_url]

    if @reservation.save
      redirect_to "/reservations", :notice => "Reservation created successfully."
    else
      render 'new'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    @reservation.destroy

    redirect_to "/reservations", :notice => "Reservation deleted."
  end
end
