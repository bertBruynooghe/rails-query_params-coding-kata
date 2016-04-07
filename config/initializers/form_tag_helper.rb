module ActionView
  module Helpers
    module FormTagHelper
      def hidden_field_tag_with_hash_support(name, value = nil, options = {})
        case value
        when String
          hidden_field_tag_without_hash_support(name, value, options)
        when Hash
            value.reduce('') do |c, (k, v)|
              c << hidden_field_tag_without_hash_support("#{name}[#{k}]", v, options)
            end.html_safe
        end
      end
      alias_method_chain :hidden_field_tag, :hash_support
    end
  end
end
