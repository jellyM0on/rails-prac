class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :content, :author_name, presence: true
  validates :title, length: { in: 1..100 }
  validates :content, length: { in: 1..1000 }
  validates :author_name, length: { in: 1..50 }

  def self.ransackable_attributes(auth_object = nil)
    %w[title author_name]
  end
end
