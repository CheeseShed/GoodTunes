class Race < ActiveRecord::Base
	belongs_to :user
	has_one :playlist, :dependent => :destroy

	validates :user_id, :presence => true

	before_create :build_playlist

	def can_modify?(user)
    	self.user == user
  	end
end
