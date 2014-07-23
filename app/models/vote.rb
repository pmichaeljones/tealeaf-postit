class Vote < ActiveRecord::Base
  belong_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :voteable, polymorphic: true
end
