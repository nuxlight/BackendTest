module UserManager
  class CreateUserService < ApplicationService
    def initialize(name)
      @name = name
      @alpha = ('A'..'Z').to_a
    end

    def call
      ActiveRecord::Base.transaction do
        while User.find_by(name: @name) != nil
          @name = generateUsername(3)
          Rails.logger.debug @name
        end
        user = User.new(name: @name)
        response = user.save
        if response
          return { 'data' => user, 'status' => :created }
        else
          return { 'data' => user.errors.messages, 'status' => :bad_request }
        end
      end
    end

    def generateUsername(length)
      username = ''
      (1..length).each do |_i|
        username.prepend(@alpha[rand(@alpha.length)])
      end
      username
    end
  end
end
