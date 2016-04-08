module ParamsCloningConcern
  extend ActiveSupport::Concern

  class Cloner
    attr_reader :params

    def initialize(params, overrides)
      @params = params.dup
      @params.extend(PostsParamsConcern)
      overrides.each { |k, v| assign(k, v) }
    end

    private

    def assign(k,v)
      if !v.blank? && params[k] != v && params.respond_to?("#{k}=")
        params.send("#{k}=", v)
      else
       params[k] = v
      end
    end
  end

  def with(overrides)
    Cloner.new(self, overrides).params
  end

end
