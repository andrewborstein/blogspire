class Blog < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_attached_file :image, default_url: ''
  has_many :comments
  has_many :likes, as: :likable

  # Validations
  validates :body, presence: true
  validates :title, presence: true
  validates :user, presence: true
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}

  # Class Methods
  def self.liked_by_user(id)
    liked_blog_ids = Like.for_blog.for_user(id).pluck(:likable_id)
    where(id: liked_blog_ids)
  end

  # Instance Methods
  def card_image_url
    image.url.presence || '//via.placeholder.com/1000x250?text=%20'
  end
end
