class User < ApplicationRecord
  has_many :categories
  has_many :transactions

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end
