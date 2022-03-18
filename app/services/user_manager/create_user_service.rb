module UserManager
  class CreateUserService < ApplicationService
    def initialize(name)
      super()
      @name = name
      @alpha = ('A'..'Z').to_a # Pseaudo max size
    end

    def call
      ActiveRecord::Base.transaction do
        Rails.logger.debug database_full?($global_pseudo_size)
        while User.find_by(name: @name) != nil
          @name = generate_username($global_pseudo_size)
          Rails.logger.debug @name
        end
        user = User.new(name: @name)
        response = user.save
        return { data: user, status: :created } if response

        return { data: user.errors.messages, status: :bad_request }
      end
    end

    def database_full?(pseudo_size)
      User.count == (@alpha.length**pseudo_size)
    end

    def generate_username(length)
      username = ''
      (1..length).each do |_i|
        username.prepend(@alpha[rand(@alpha.length)])
      end
      username
    end
  end
end
