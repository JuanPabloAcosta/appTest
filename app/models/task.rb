class Task < ApplicationRecord
  validates :description, presence: true
  enum status: { incomplete: 0, complete: 1 }

  #Relations
  belongs_to :user
end
