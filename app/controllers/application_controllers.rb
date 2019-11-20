class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate
    def authenticate #環境変数API_TOKENがrailsとvueで一致しないと認証されない
        authenticate_or_request_with_http_token do |token,options|
            token == ENV.fetch('API_TOKEN')
        end
    end
end