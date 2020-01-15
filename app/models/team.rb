class Team < ApplicationRecord
	extend FriendlyId
	friendly_id :slug_it, use: :slugged

	# Association for users as members of a team through team membership
	has_many :team_memberships, dependent: :destroy
	has_many :users, through: :team_memberships

	private

	def slug_it
		slugs = []
		3.times do
			slug = ""
			slug += self.name[0..8].parameterize.underscore + "-" if self.name
			slug += SecureRandom.urlsafe_base64(4).parameterize.downcase
			slugs <<  slug
		end
		slugs
	end

end
