class Blog < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :comments

  # Validations
  validates :body, presence: true
  validates :title, presence: true
  validates :user, presence: true
end
