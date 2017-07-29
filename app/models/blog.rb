class Blog < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_attached_file :image, default_url: ''
  has_many :comments

  # Validations
  validates :body, presence: true
  validates :title, presence: true
  validates :user, presence: true
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}

  def card_image_url
    image.url.presence || '//via.placeholder.com/1000x250?text=%20'
  end
end
