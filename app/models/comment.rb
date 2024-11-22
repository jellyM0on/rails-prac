class Comment < ApplicationRecord
  belongs_to :post

  validates :post_id, :content, :commenter_name, presence: true
  validates :post_id, numericality: { only_integer: true }
  validates :content, length: { in: 1..1000 }
  validates :commenter_name, length: { in: 1..50 }
end
