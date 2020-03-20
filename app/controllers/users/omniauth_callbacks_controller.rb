# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:facebook]
  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   # @user = User.from_omniauth(request.env["omniauth.auth"])
  #   @user = User.omniauth :facebook, Rails.application.credentials.facebook[:app_id], Rails.application.credentials.facebook[:app_secret], name: :facebook, scope: %w(email)
  #   if @user.persisted?
  #     flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'facebook'
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
  #     redirect_to new_user_registration_path, alert: @user.errors.full_messages.join("\n")
  #   end
  # end

  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]

    if @user.persisted? #ユーザー情報が登録済みなので、新規登録ではなくログイン処理を行う
      sign_in_and_redirect @user, event: :authentication
    else #ユーザー情報が未登録なので、新規登録画面へ遷移する
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
  end
end
