class NewWordsController < ApplicationController
  before_filter :with_user

  def index
    @new_words = NewWord.all(:conditions => {:user_id => @user.id})
  end

  def show
    @new_word = NewWord.find(params[:id])
  end

  def new
    @new_word = NewWord.new
  end

  def create
    @new_word = NewWord.new(params[:new_word])
    if @new_word.save
      flash[:notice] = "Successfully created new word."
      redirect_to '/word_game'
    else
      render :action => 'new'
    end
  end

  def edit
    @new_word = NewWord.find(params[:id])
  end

  def update
    @new_word = NewWord.find(params[:id])
    if @new_word.update_attributes(params[:new_word])
      flash[:notice] = "Successfully updated new word."

      if params[:from_home]
        redirect_to '/word_game'
      else
        redirect_to user_new_word_path(@user, @new_word)
      end
    else
      render :action => 'edit'
    end
  end

  def destroy
    @new_word = NewWord.find(params[:id])
    @new_word.destroy
    flash[:notice] = "Successfully destroyed new word."
    redirect_to user_new_words_url
  end

  private

  def with_user
    @user = User.find_by_id params[:user_id]
  end
end
