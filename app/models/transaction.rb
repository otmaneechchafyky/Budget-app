class Transaction < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :amount, presence: true
end
