class User < ApplicationRecord
  validates :name, presence: { message: 'Username should be present' }
  validates :name, length: { minimum: 3, maximum: 3 }
  validates :name, format: { with: /\A[A-Z]+\z/,
                             message: 'Username should not contain a number and it should be in uppercase' }
end
