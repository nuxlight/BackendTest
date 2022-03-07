class UserController < ApplicationController
    def SignIn
        user = User.new(name: params[:name])
        response = user.save
        puts user.errors.messages
        if response
            render json: user, status: :created
        else
            render json: user.errors.messages, status: 500
        end
    end
end
