require 'rails_helper'

describe Emotions::Emotion do
  it { should belong_to(:picture) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:picture) }
  it { should validate_presence_of(:type) }
end
