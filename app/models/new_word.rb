class NewWord < ActiveRecord::Base
  attr_accessible :word_id, :user_id, :note
  
  belongs_to :user
  belongs_to :word
end
