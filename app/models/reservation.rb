class Reservation < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :item_id, :presence => true
  validates :active, :presence => true

  belongs_to :user
  belongs_to :item
end
