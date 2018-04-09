class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Response

  rescue_from(ActionController::ParameterMissing, with: :rescue_from_parameter_missing)
  rescue_from(ActiveRecord::RecordNotSaved, with: :rescue_from_record_not_saved)
  rescue_from(ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid)
  rescue_from(ActiveRecord::RecordNotDestroyed, with: :rescue_from_record_not_destroyed)
  rescue_from(ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found)

  # Devise code
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  protected

  def rescue_from_parameter_missing(exception)
    rescue_from(:bad_request, exception)
  end

  def rescue_from_record_not_saved(exception)
    rescue_from(:unprocessable_entity, exception)
  end

  def rescue_from_record_not_found(exception)
    rescue_from(:not_found, exception)
  end

  def rescue_from_record_invalid(exception)
    rescue_from(:unprocessable_entity, exception)
  end

  def rescue_from_record_not_destroyed(exception)
    rescue_from(:unprocessable_entity, exception)
  end

  def rescue_from(status_code, exception)
    json_response({ message: exception.message }, status_code)
  end

  # Devise methods
  # Authentication key(:username) and password field will be added automatically by devise.
  def configure_permitted_parameters
    added_attrs = %i[email first_name last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
