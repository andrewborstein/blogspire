class User < ActiveRecord::Base
  # Associations
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_attached_file :image, default_url: ''

  # Validations
  validates :email, presence: true, uniqueness: true
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
