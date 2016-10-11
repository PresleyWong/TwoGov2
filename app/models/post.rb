class Post < ActiveRecord::Base
	include PgSearch 
	belongs_to :user

	has_many :invitations,    :dependent => :destroy
	
	geocoded_by :address
  	# If address is updated, geocode will generate a new set of latitude and longitude
  	after_validation :geocode, if: :address_changed?


    validates :activity_type, :language_type, :description, :address, presence: true
    pg_search_scope :search_by_activities, :against => [:activity_type]
    pg_search_scope :search_by_languages, :against => [:language_type]
    pg_search_scope :search_by_durations, :against => [:duration_type]
	pg_search_scope :search_by_address, :against => [ :address]
end
