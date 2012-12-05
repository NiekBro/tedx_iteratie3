class Video < ActiveRecord::Base
  attr_accessible :description, :thumbnail_url, :title, :youtube_id
  has_one :circle
end
