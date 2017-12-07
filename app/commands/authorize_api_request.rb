class AuthorizeApiRequest 
    prepend SimpleCommand 
    def initialize(headers = {}) 
    @headers = headers 
    end 

    def call 
        user 
    end 
    
    private 
    
    attr_reader :headers 
    
    def user 
        @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token 
        @user || errors.add(:token, 'Invalid token') && nil 
    end 
    
    def decoded_auth_token
        puts 'decoded_auth_token' 
        @decoded_auth_token ||= JsonWebToken.decode(http_auth_header) 
        puts http_auth_header
        puts @decoded_auth_token
        puts JsonWebToken.decode('eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE1MTI3NzA1MDd9.XtkENYu_xiIfOKoVZ7eXIbPhgH3h9pnY3Z4h3j0QGcE')
    end 
    
    def http_auth_header 
        if headers['Authorization'].present? 
            return headers['Authorization'].split(' ').last 
        else 
            errors.add(:token, 'Missing token') 
        end 
        nil 
        end 
    end
