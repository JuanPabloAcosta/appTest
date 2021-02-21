class Task < ApplicationRecord

  scope :search, -> (term){where("description ILIKE ?", "%" + term +"%")}
  validates :description, presence: true
  enum status: { incomplete: 0, complete: 1 }

  #Relations
  belongs_to :user
end
