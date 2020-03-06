class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configre_permitted_parameters, if: :devise_controller?

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] && password == Rails.application.credentials[:basic_auth][:pass]
    end
  end


  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :furigana_first, :furigana_last, :birthdate])
  end
  
end
