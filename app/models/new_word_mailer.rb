class NewWordMailer < ActionMailer::Base
  def latest_new_words(user)
    recipients    user.email
    subject       "#{user.username}'s New Words"
    from          "english_learning@theplant.jp"
    body          :new_words => user.unsent_new_words, :user => user
    content_type  "text/html"
  end
end