class WordGameController < ApplicationController
  def index
    get_word
    get_player

    if NewWord.find_by_user_id_and_word_id( @current_player.id, session[:word_id] )
      @new_word = @current_player.unsent_new_words.find_by_word_id session[:word_id]
      @new_word_post_url = user_new_word_path(@current_player, @new_word)
    else
      @new_word =  NewWord.new(:word_id => session[:word_id], :user_id => @current_player.id)
      @new_word_post_url = user_new_words_path(@current_player)
    end
  end

  def change_word
    set_new_word_id
    redirect_to :action => "index"
  end

  def change_player
    set_new_word_id
    session[:all_user].unshift(session[:all_user].pop)
    redirect_to :action => "index"
  end

  def send_new_words_mail
    stats = User.all_with_new_words.collect do |user|
      stat = { :username => user.username, :word_count => user.unsent_new_words.count }
      NewWordMailer.deliver_latest_new_words(user)
      user.mark_all_new_words_as_sent
      stat
    end
    render :text => stats.inspect
  end

  private

  def set_new_word_id
    session[:word_id] = rand(session[:word_id_range] ||= Word.last.id)
  end

  def get_word
    set_new_word_id if session[:word_id].nil?
    @random_word = Word.find_by_id(session[:word_id])
  end

  def get_player
    session[:all_user] ||= User.all(:order => "order_number desc")
    @current_player = session[:all_user].last
  end
end