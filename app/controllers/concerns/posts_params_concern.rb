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

  # TODO: pull next ones up
  def with(overrides)
    params = self.dup
    params.extend(PostsParamsConcern)
    overrides.each { |k, v| params.assign(k, v) }
    params
  end

  protected

  def assign(k,v)
    if !v.blank? && self[k] != v && self.respond_to?("#{k}=")
      self.send("#{k}=", v)
    else
      self[k] = v
    end
  end
end
