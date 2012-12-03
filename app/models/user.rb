class User < ActiveRecord::Base
  attr_accessible :phone, :poet
  has_many :poems
  has_many :requests
end
