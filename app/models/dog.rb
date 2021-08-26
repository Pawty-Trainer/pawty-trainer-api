class Dog < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :age, presence: true, numericality: true
  validates :breed, presence: true
end
