class UserController < ApplicationController
    def create
        res = UserManager::CreateUserService.call(params[:name])
        render json: res["data"], status: res["status"]
    end
end
