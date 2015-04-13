class User < ActiveRecord::Base
  has_secure_password
  has_many :questions, foreign_key: 'creator_id'
  has_many :answers
  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  before_save :rename

  def rename
     self.name = email.slice(/^(.*?)@/).chop
  end

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end
