class Item < ActiveRecord::Base
  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :description, :presence => true
  validates :price, :presence => true
  validates :image_url, :presence => true

  belongs_to :user
  has_many :reservations
end
