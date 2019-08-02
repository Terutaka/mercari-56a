class ApplicationController < ActionController::Base
  # before_action :basic_auth, if: :production?
  before_action :basic_auth
  protect_from_forgery with: :exception

  private

  # def production?
  #   Rails.env.production?
  # end

  def basic_auth
    # http_basic_authenticate_with :username => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD']

    authenticate_or_request_with_http_basic do |username, password|
    # http_basic_authenticate_with do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end