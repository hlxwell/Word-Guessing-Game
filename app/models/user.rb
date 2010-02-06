class User < ActiveRecord::Base
  attr_accessible :username, :email, :order_number
  
  has_many :new_words
end
