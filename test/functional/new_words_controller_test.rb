require 'test_helper'

class NewWordsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => NewWord.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    NewWord.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    NewWord.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to new_word_url(assigns(:new_word))
  end
  
  def test_edit
    get :edit, :id => NewWord.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    NewWord.any_instance.stubs(:valid?).returns(false)
    put :update, :id => NewWord.first
    assert_template 'edit'
  end
  
  def test_update_valid
    NewWord.any_instance.stubs(:valid?).returns(true)
    put :update, :id => NewWord.first
    assert_redirected_to new_word_url(assigns(:new_word))
  end
  
  def test_destroy
    new_word = NewWord.first
    delete :destroy, :id => new_word
    assert_redirected_to new_words_url
    assert !NewWord.exists?(new_word.id)
  end
end
