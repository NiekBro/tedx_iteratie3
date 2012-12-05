class Circle < ActiveRecord::Base
  attr_accessible :unique_id, :circle_type
  acts_as_commentable
  has_reputation :votes, source: :user, aggregated_by: :sum
  belongs_to :video
  has_and_belongs_to_many :users 
end
