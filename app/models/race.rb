class Race < ActiveRecord::Base
	belongs_to :user
	has_one :playlist, :dependent => :destroy

	validates :user_id, :presence => true

	before_create :build_playlist

	def can_modify?(user)
    	self.user == user
  	end

  	has_attached_file :mainImage, styles: {
	    thumb: '100x100>',
	    square: '200x200#',
	    medium: '300x300>'
	}

	has_attached_file :secondImage, styles: {
	    thumb: '100x100>',
	    square: '200x200#',
	    medium: '300x300>'
	}

	has_attached_file :thirdImage, styles: {
	    thumb: '100x100>',
	    square: '200x200#',
	    medium: '300x300>'
	}

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :mainImage, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :secondImage, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :thirdImage, :content_type => /\Aimage\/.*\Z/

end
