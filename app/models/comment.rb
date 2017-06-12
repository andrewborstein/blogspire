class Comment < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :blog

  # Validations
  validates :body, presence: true
  validates :blog, presence: true
  validates :user, presence: true
end
