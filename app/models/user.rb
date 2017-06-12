class User < ActiveRecord::Base
  # Associations
  has_many :blogs
  has_many :comments

  # Validations
  validates :name, presence: true # string length
  validates :email, presence: true # unique, string length

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
