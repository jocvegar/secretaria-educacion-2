class Package < ApplicationRecord
	extend FriendlyId
	friendly_id :slug_it, use: :slugged

	scope :on_going, -> { where(finished: false) }
	scope :finished, -> { where(finished: true) }

	has_many :assignments, -> { order(position: :asc) }, dependent: :destroy, inverse_of: :package
	accepts_nested_attributes_for :assignments, allow_destroy: true, reject_if: :all_blank
	has_many :teams, through: :assignments

	validates_presence_of :title, :start_date

	private

	def slug_it
		slugs = []
		3.times do
			slug = ""
			slug += self.title[0..8].parameterize.underscore + "-" if self.title
			slug += SecureRandom.urlsafe_base64(4).parameterize.downcase
			slugs << slug
		end
		slugs
	end
end
