module PostsHelper
  # create a new params object based on the current params with some alterations
  def posts_params(current_params, overrides)
    PostsQueryParams.new(current_params, overrides).params
  end
end
