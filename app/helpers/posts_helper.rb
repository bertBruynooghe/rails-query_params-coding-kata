module PostsHelper
  # create a new params object based on the current params with some alterations
  def post_params(current_params, new_params)
    params = current_params.deep_dup
    new_params.reduce(params) do |result, (k,v)|
      send("post_sanitize_for_#{k}", result, v) if respond_to?("post_sanitize_for_#{k}")
      params[k] = v
    end
    params
  end

  def post_sanitize_for_title_starting_with(params, _)
    params[:page] = 1
  end

  def post_sanitize_for_reorder(params, _)
    params[:page] = 1
  end
end
