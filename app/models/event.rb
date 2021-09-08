class Event < ApplicationRecord
  belongs_to :dog

  validates :name, :event_datetime, presence: true
  # validates :event_datetime, presence: true
end
