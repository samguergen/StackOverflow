class User < ActiveRecord::Base
  has_secure_password
  has_many :questions, foreign_key: 'creator_id'
  has_many :answers


end
