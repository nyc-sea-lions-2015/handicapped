class User < ActiveRecord::Base
  has_secure_password
  has_many :scores

  # So a user HasMany courses Through scores...
  has_many :courses, through: :scores

  # We should have some model level validations also...
  validates_presence_of :username
end
