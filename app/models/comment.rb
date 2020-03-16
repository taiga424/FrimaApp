class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :text, length: { maximum:100 }, presence: true
end
