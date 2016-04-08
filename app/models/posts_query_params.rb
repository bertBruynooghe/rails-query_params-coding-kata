class PostsQueryParams < QueryParams
  validates_numericality_of :page, only_integer: true, greater_than: 0

  def title_starting_with=(value)
    params[:page] = 1
    params[:title_starting_with] = value
  end

  def reorder=(value)
    params[:page] = 1
    params[:reorder] = value
  end
end