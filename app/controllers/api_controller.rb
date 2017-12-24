class ApiController < ActionController::API
  include Pundit

  rescue_from BusinessError, with: :business_error
  rescue_from ActiveRecord::ActiveRecordError, with: :bad_request
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActiveModel::ValidationError, with: :unprocessable_entity
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    render json: { message: "#{policy_name}.#{exception.query[0..-2]}" }, status: :forbidden
  end

  def unprocessable_entity(exception)
    exception.message.slice! 'Validation failed: '
    render json: { message: exception.message }, status: :unprocessable_entity
  end

  def bad_request(exception)
    render json: { message: exception.message }, status: :bad_request
  end

  def business_error(exception)
    render json: { message: exception.message }, status: :bad_request
  end
end
