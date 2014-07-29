class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  before_save :generate_slug

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  def generate_slug
    self.slug = self.username
  end

  def to_param
    self.slug
  end

end
