require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Test User not valid length' do
    gen_name = generate_username(2)
    a = User.new(name: gen_name)
    res = a.save
    if !res
      assert true
    else
      assert false
    end
  end

  test 'Test User with valid length' do
    gen_name = generate_username($global_pseudo_size)
    a = User.new(name: gen_name)
    res = a.save
    if res
      assert true
    else
      assert false
    end
  end

  def generate_username(length)
    alpha = ('A'..'Z').to_a
    username = ''
    (1..length).each do |_i|
      username.prepend(alpha[rand(alpha.length)])
    end
    username
  end
end
