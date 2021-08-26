require 'rails_helper'

RSpec.describe Dog, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:breed) }
  it { should validate_presence_of(:age) }
  it { should validate_numericality_of(:age) }

  it { should belong_to(:user) }
end
