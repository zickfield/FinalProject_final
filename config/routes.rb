Rails.application.routes.draw do

  devise_for :users

  root "lists#index"

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------
  
  # Routes for the Reservation resource:

  # READ
  get "/reservations", :controller => "reservations", :action => "index"

  # DELETE
  get "/delete_reservation/:id", :controller => "reservations", :action => "destroy"
  #------------------------------
  
  # Routes for the List resource:
  # READ
  get "/lists", :controller => "lists", :action => "index"
  
  # UPDATE
  get "/lists/:id/book", :controller => "lists", :action => "book"

  #------------------------------

end
