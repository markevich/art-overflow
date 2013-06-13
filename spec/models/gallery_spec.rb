require 'spec_helper'

describe Gallery do
  it { should belong_to(:user) }
  it { should have_many(:pictures) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
end
