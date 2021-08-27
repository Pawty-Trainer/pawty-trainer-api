class Event < ApplicationRecord
  belongs_to :dog

  validates :name, presence: true
  validates :event_datetime, presence: true
end
