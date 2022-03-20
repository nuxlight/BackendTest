module UserManager
  class CreateUserService < ApplicationService
    def initialize(name)
      super()
      @name = name
      @alpha = ('A'..'Z').to_a # Pseaudo max size
    end

    def call
      ActiveRecord::Base.transaction do
        return { data: ['database full'], status: :insufficient_storage } if database_full?($global_pseudo_size)
        users = User.all # Improving performance, only one call to database instance
        @name = generate_username($global_pseudo_size) while !users.find { |el| el.name == @name}.nil?
        user = User.new(name: @name)
        response = user.save
        return { data: user, status: :created } if response

        return { data: user.errors.messages, status: :bad_request }
      end
    end

    def database_full?(pseudo_size)
      User.count >= (@alpha.length**pseudo_size)
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
