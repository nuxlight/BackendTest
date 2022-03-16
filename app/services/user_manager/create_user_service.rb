module UserManager
    class CreateUserService < ApplicationService
        def initialize(name)
            @name = name
        end

        def call
            ActiveRecord::Base.transaction do
                alpha = ('A'..'Z').to_a
                while User.find_by(name: @name) != nil
                    @name = alpha[rand(alpha.length)]+alpha[rand(alpha.length)]+alpha[rand(alpha.length)]
                end
                user = User.new(name: @name)
                response = user.save
                if response
                    return {"data" => user, "status" => :created}
                else
                    return {"data" => user.errors.messages, "status" => :bad_request}
                end
            end
        end
    end
end