class Like < ActiveRecord::Base
  LIKABLE_TYPES = %w(Blog Comment).freeze

  # Associations
  belongs_to :likable, polymorphic: true
  belongs_to :user

  # Validations
  validates :likable, presence: true
  validates :likable_id, uniqueness: { scope: :user_id }
  validates :likable_type, inclusion: { in: LIKABLE_TYPES }
  validates :user, presence: true

  # Scopes
  scope :for_blog, ->{ where(likable_type: 'Blog') }
  scope :for_comment, ->{ where(likable_type: 'Comment') }
  scope :for_user, ->(user){ where(user: user) }
end
