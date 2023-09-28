class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :category_transactions, class_name: 'Transaction'

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :icon, presence: true
end
