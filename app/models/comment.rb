class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user, optional: true

  validates :text, length: { maximum:100 }, presence: true
end
