class Dog < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :age, presence: true, numericality: true
  validates :breed, presence: true
end
