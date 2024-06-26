class OauthsController < ApplicationController
  skip_before_action :require_login, only: [:oauth, :callback, :destroy]

  require 'net/http'
  require 'uri'
  require 'json'
  require 'jwt'

  def oauth
    redirect_to line_oauth_url, allow_other_host: true
  end

  def callback
    provider = 'line'
    if params[:error]
      redirect_to root_path
      return
    end

    token_response = fetch_line_token(params[:code])
    if token_response[:access_token]
      line_id = decode_id_token(token_response[:id_token], ENV['LINE_SECRET'])
      @user = User.find_or_create_by(line_user_id: line_id)
      reset_session
      auto_login(@user)
      if @user.persisted?
        redirect_to line_friends_url
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end

  private

  def auth_params
    params.permit(:code, :provider, :error, :state)
  end

  def line_oauth_url
    client_id = ENV['LINE_KEY']
    redirect_uri = 'https://reminder-chat.com/auth/line/callback'
    state = SecureRandom.hex(15)
    scope = 'openid profile'
    bot_prompt = 'aggressive'
    "https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=#{client_id}&redirect_uri=#{CGI.escape(redirect_uri)}&state=#{state}&bot_prompt=#{bot_prompt}&scope=#{CGI.escape(scope)}"
  end

  def fetch_line_token(code)
    uri = URI.parse('https://api.line.me/oauth2/v2.1/token')
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(
      'grant_type' => 'authorization_code',
      'code' => code,
      'redirect_uri' => 'https://reminder-chat.com/auth/line/callback',
      'client_id' => ENV['LINE_KEY'],
      'client_secret' => ENV['LINE_SECRET']
    )

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def decode_id_token(id_token, client_secret)
    decoded_token = JWT.decode(id_token, client_secret, true, { algorithm: 'HS256' })
    decoded_token[0]['sub']
  rescue JWT::DecodeError => e
    Rails.logger.error("Token decode error: #{e.message}")
    nil
  end
end
