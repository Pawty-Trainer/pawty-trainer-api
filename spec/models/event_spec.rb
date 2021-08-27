require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:event_datetime) }

  it { should belong_to(:dog) }
end
