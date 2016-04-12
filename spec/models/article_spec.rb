require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should have_and_belong_to_many(:tags) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
