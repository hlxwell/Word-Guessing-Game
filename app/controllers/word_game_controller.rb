class WordGameController < ApplicationController
  def index
    get_word
    get_player
    @new_word = NewWord.new(:word_id => session[:word_id], :user_id => @current_player.id)
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