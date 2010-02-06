require 'test_helper'

class NewWordTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert NewWord.new.valid?
  end
end
