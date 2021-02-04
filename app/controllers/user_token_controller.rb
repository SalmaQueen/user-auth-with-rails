class UserTokenController < ApplicationController
    # skip_before_action :verify_authenticity_token
    skip_before_action :verify_authenticity_token, raise: false
    def login
        user = User.find_by_email(params[:auth][:email])
        if !user.blank?
            if user.authenticate(params[:auth][:password]) 
                render json: {
                    status: :created,
                    logged_in: true,
                    user: user
                }
            else
                render json: {error: 'Invalid Email.'}
    
            end
        else
            render json: {error: 'Invalid Credentials.'}
        end
    end

  
end



