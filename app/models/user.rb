class User < ApplicationRecord
    attr_accessor :password, :password_confirmation
    before_save :set_password
    def authenticate(password)
        self.password
    end
    
     def set_password
     end 
end
