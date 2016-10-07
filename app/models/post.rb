class Post < ActiveRecord::Base
	include PgSearch
	belongs_to :user

	geocoded_by :address
  	# If address is updated, geocode will generate a new set of latitude and longitude
  	after_validation :geocode, if: :address_changed?


    validates :activity_type, :language_type, :duration_type, :description, :address, presence: true

	pg_search_scope :search_by_columns, :against => [:location, :activity_type]
end
