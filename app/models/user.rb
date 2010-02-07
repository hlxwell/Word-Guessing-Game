class User < ActiveRecord::Base
  attr_accessible :username, :email, :order_number
  
  has_many :new_words
  has_many :unsent_new_words, :class_name => "NewWord", :conditions => { :sent => false }
  
  def self.all_with_new_words
    User.all.select do |user|
      user if user.unsent_new_words.count > 0
    end
  end

  def mark_all_new_words_as_sent
    self.unsent_new_words.each do |word|
      word.update_attribute :sent, true
    end
  end
end
