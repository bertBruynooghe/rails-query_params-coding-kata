module ActionView
  # = Action View Form Tag Helpers
  module Helpers
    # Provides a number of methods for creating form tags that don't rely on an Active Record object assigned to the template like
    # FormHelper does. Instead, you provide the names and values manually.
    #
    # NOTE: The HTML options <tt>disabled</tt>, <tt>readonly</tt>, and <tt>multiple</tt> can all be treated as booleans. So specifying
    # <tt>disabled: true</tt> will give <tt>disabled="disabled"</tt>.
    module FormTagHelper
      def hidden_field_tag_with_hash_support(name, value = nil, options = {})
        case value
        when String
          hidden_field_tag_without_hash_support(name, value, options)
        when Hash
          value.map do |k, v|
            hidden_field_tag_without_hash_support("#{name}[#{k}]", v, options)
          end.join('')
        end
      end
      # alias_method_chain :hidden_field_tag, :hash_support
    end
  end
end
