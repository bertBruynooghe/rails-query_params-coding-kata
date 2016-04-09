module PostsParamsConcern
  extend ActiveSupport::Concern

  # include ActiveModel::Validations
  #
  # attr_reader :errors
  #
  # validates_numericality_of :page, only_integer: true, greater_than: 0

  def title_starting_with=(value)
    self[:page] = 1
    self[:title_starting_with] = value
  end

  def reorder=(value)
    self[:page] = 1
    self[:reorder] = value
  end

  def dup_with_posts
    dup_without_posts.tap{|p| p.extend(PostsParamsConcern)}
  end
  alias_method_chain :dup, :posts
end
