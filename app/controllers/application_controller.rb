class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    include Knock::Authenticable
    skip_before_action :verify_authenticity_token

end
