module ParamsCloningConcern
  extend ActiveSupport::Concern

  class Cloner
    attr_reader :params

    def initialize(params, overrides)
      @params = params.dup
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

  # TODO: workaround for some issue. I guess it would be better to let controller#params create a wrapper class around params...
  def dup_with_cloner
    dup_without_cloner.tap{|p| p.extend ParamsCloningConcern}
  end
  alias_method_chain :dup, :cloner
end
