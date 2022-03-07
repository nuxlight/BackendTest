class UserValidator < ActiveModel::Validator
    def validate(record)
        alpha = "ABCDEFGHIJKLMNOPKRSTUVWXYZ"
        if record.name.length != 3
            record.errors[:errors] << "User should have 3 characters"
        end
        if User.find_by(name: record.name) != nil
            # User exist in database, try to generate a new user
            while User.find_by(name: record.name) != nil
                record.name = alpha[rand(26)]+alpha[rand(26)]+alpha[rand(26)]
            end
        end
    end
end
class User < ApplicationRecord
    validates_with UserValidator
end
