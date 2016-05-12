module ActionView
  module Helpers
    module FormTagHelper
      def text_field_tag_with_hash_value_support(name, value = nil, options = {})
        if value.is_a?(Hash)
          capture do
            value.each { |k,v| concat text_field_tag("#{name}[#{k}]", v, options) }
          end
        else
          text_field_tag_without_hash_value_support(name, value, options)
        end
      end
      alias_method_chain :text_field_tag, :hash_value_support
    end
  end
end
