class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  def self.total(num, kind)
    Vote.where(votable_id: num, votable_type: kind).sum(:point)
  end

end
