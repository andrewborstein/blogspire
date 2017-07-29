class User < ActiveRecord::Base
  # Associations
  has_many :blogs
  has_many :comments
  has_attached_file :image, default_url: ''

  # Validations
  validates :name, presence: true # string length
  validates :email, presence: true # unique, string length
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
