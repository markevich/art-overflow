require 'spec_helper'

describe Like do
  it_should_behave_like 'trackable', :like

  it { should belong_to(:likeable) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:likeable) }
end
