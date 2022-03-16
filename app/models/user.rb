class User < ApplicationRecord
    validates_presence_of :name, :message => "Username should be present" 
    validates :name, length: {minimum: 3, maximum: 3}
    validates :name, format: { with: /\A[A-Z]+\z/,
        message: "Username should not contain a number and it should be in uppercase" }
end
