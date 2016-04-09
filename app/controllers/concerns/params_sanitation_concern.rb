module ParamsSanitationConcern
  class MergerWithSanitation
    attr_reader :params

    def initialize(params, other_hash)
      @params = params.clone
      other_hash.each do |k,v|
        merge_key_value(k, v)
      end
    end

    private

    def merge_key_value(k, v)
      if @params[k]!= v && !v.blank? && @params.respond_to?("#{k}=")
        @params.send("#{k}=", v)
      else
        @params[k] = v
      end
    end
  end

  def merge(other_hash)
    MergerWithSanitation.new(self, other_hash).params
  end
end