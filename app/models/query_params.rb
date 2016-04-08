class QueryParams
  include ActiveModel::Validations

  attr_reader :errors, :params

  def initialize(current_params, overrides)
    @params = current_params.deep_dup.clear
    current_params.each { |k, v| assign(k, v) }
    overrides.each { |k, v| assign(k, v) }
    @errors = ActiveModel::Errors.new(self)
  end

  def method_missing(method_name, *args)
    if args.empty?
      @params[method_name]
    else
      super
    end
  end

  private

  def assign(k, v)
    if !v.blank? && params[k] != v && respond_to?("#{k}=")
      send("#{k}=", v)
    else
      params[k] = v
    end
  end
end