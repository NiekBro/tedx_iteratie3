class User < ActiveRecord::Base
  attr_accessible :avatar, :email, :name, :hookup_id
  belongs_to :hookup



end
