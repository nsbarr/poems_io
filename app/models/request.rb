class Request < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :poems
end
