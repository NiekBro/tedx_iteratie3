class Blogpost < ActiveRecord::Base
	belongs_to :user

	attr_accessible :title, :body, :user_id

	acts_as_commentable
	acts_as_taggable
	has_reputation :votes, source: :user, aggregated_by: :sum

end
