class Category < ActiveRecord::Base
  has_many :posts
  has_many :post_categories
  has_many :posts, through: :post_categories

  before_save :generate_slug

  validates :name, presence: true, uniqueness: true, length: {minimum: 3}

  def generate_slug
    self.slug = self.name.split(" ").join("-")
  end

  def to_param
    self.slug
  end

end
