class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO: this should only be done in case of index
  def params_with_cloning_support
    result = params_without_cloning_support
    result.extend(ParamsCloningConcern) unless result.is_a? ParamsCloningConcern
    result
  end
  alias_method_chain :params, :cloning_support

end
