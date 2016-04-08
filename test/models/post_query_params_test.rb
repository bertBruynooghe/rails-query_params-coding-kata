require 'test_helper'

class PostQueryParamsTest < ActiveSupport::TestCase
  #include ActiveModel::Lint::Tests

  def test_that_page_is_validated
    model = PostsQueryParams.new(page: -1)
    assert(!model.valid?)
    assert_includes(model.errors.full_messages, 'Page must be greater than 0')
    assert_equal(1, model.errors.full_messages.length, "Too many errors: #{model.errors.full_messages}")
  end
end
