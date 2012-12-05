class User < ActiveRecord::Base
  	attr_accessible :name, :email, :avatar
  	has_many :blogposts
	has_many :evaluations, class_name: "RSEvaluation", as: :source
	acts_as_followable
	acts_as_follower
	has_reputation :votes, source: {reputation: :votes, of: :blogposts}, aggregated_by: :sum
	has_and_belongs_to_many :circles
	def voted_for?(blogpost)
	  evaluations.where(target_type: blogpost.class, target_id: blogpost.id).present?
	end

	def self.from_omniauth auth
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.email = auth.info.email
	    user.avatar = auth.info.image
	    user.save!
	  end
	end
end
