class User < ActiveRecord::Base
  	attr_accessible :name, :email, :avatar
  	has_many :blogposts
	has_many :evaluations, class_name: "RSEvaluation", as: :source
	acts_as_followable
	acts_as_follower
	has_reputation :votes, source: {reputation: :votes, of: :blogposts}, aggregated_by: :sum

	def voted_for?(blogpost)
	  evaluations.where(target_type: blogpost.class, target_id: blogpost.id).present?
	end
end
