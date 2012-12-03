class Disease < ActiveRecord::Base
  attr_accessible :name, :hookup_id
  belongs_to :hookup
end
