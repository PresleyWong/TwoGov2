class Post < ActiveRecord::Base
	include PgSearch 
	belongs_to :user

	has_many :invitations,    :dependent => :destroy
	
	geocoded_by :address
  	# If address is updated, geocode will generate a new set of latitude and longitude
  	after_validation :geocode, if: :address_changed?


    validates :activity_type, :language_type, :description, :address, presence: true

	pg_search_scope :search_by_location, :against => [:address]
	pg_search_scope :search_any_activities,
                  :against => [:activity_type],
                  :using => {
                    :tsearch => {:any_word => true}
                  }
	pg_search_scope :search_any_languages,
                  :against => [:language_type],
                  :using => {
                    :tsearch => {:any_word => true}
                  }
	pg_search_scope :search_any_times,
                  :against => [:duration_type],
                  :using => {
                    :tsearch => {:any_word => true}
                  }
end
