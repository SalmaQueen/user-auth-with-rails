class User < ApplicationRecord
    attr_accessor :password, :password_confirmation
    def authenticate(password)
        self.password_digest == password
    end
   
end
