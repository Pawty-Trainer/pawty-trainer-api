class Dog < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :age, presence: true, numericality: true
  validates_numericality_of :age, greater_than_or_equal_to: 0
  validates :breed, presence: true
  has_many :events, dependent: :destroy
end
