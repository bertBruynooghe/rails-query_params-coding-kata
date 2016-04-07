class PostQueryParams
  include ActiveModel::Validations

  attr_reader   :errors

  validates_numericality_of :page, only_integer: true, greater_than: 0

  def initialize(params)
    @params = params
    @errors = ActiveModel::Errors.new(self)
  end

  def method_missing(method_name, *args)
    if args.empty?
      @params[method_name]
    else
      super
    end
  end
end