class Word < ActiveRecord::Base
  attr_accessible :word, :pronounce, :comment, :sample
end
