require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Test User not valid length' do
    alpha = 'ABCDEFGHIJKLMNOPKRSTUVWXYZ'
    gen_name = alpha[rand(26)] + alpha[rand(26)] + alpha[rand(26)] + alpha[rand(26)]
    a = User.new(name: gen_name)
    res = a.save
    if !res
      assert true
    else
      assert false
    end
  end

  test 'Test User with valid length' do
    alpha = 'ABCDEFGHIJKLMNOPKRSTUVWXYZ'
    gen_name = alpha[rand(26)] + alpha[rand(26)] + alpha[rand(26)]
    a = User.new(name: gen_name)
    res = a.save
    if res
      assert true
    else
      assert false
    end
  end
end
