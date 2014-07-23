class Vote < ActiveRecord::Base
  belong_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :voteable, polymorphic: true

  def up_votes
  end

  def down_votes
  end

  def total_votes
    up_votes - down_votes
  end

end
