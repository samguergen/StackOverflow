class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :creator, class_name: "User"
end
