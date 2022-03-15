class UserValidator < ActiveModel::Validator
    def validate(record)
        alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        if record.name.length != 3
            record.errors[:errors] << "Username should have 3 characters"
            return
        end
        # Test if entry user is not in lowercase or a number 
        record.name.each_char do |l|
            if l.match(/\d+/) != nil
                record.errors[:errors] << "Username should not contain a number"
                return
            end
            if l.match(/\p{Upper}/) == nil
                record.errors[:errors] << "Username should be in uppercase"
                return
            end
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
