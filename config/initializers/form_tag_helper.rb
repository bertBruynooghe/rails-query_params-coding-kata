module ActionView
  module Helpers
    module FormTagHelper
      def hidden_field_tag_with_hash_support(name, value = nil, options = {})
        if value.is_a?(Hash)
            value.reduce('') do |c, (k, v)|
              c << hidden_field_tag_without_hash_support("#{name}[#{k}]", v, options)
            end.html_safe
        else
          hidden_field_tag_without_hash_support(name, value, options)
        end
      end
      alias_method_chain :hidden_field_tag, :hash_support
    end
  end
end
