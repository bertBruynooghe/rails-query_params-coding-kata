module PostsHelper
  def next_sort_order_for(attr)
    prev_sort = params.fetch('reorder', {})[attr]
    prev_sort == 'asc' ? :desc : :asc
  end
end
