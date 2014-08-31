require 'rails_helper'

describe Album do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name) }
  it { should have_many(:pictures).dependent(:destroy) }
end
