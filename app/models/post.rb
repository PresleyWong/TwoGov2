class Post < ActiveRecord::Base
	belongs_to :user

	geocoded_by :address
  	# If address is updated, geocode will generate a new set of latitude and longitude
  	after_validation :geocode, if: :address_changed?


    validates :activity_type, :language_type, :duration_type, :description, :address, presence: true
end
