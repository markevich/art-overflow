require 'spec_helper'
describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:commentable) }

  it { should respond_to(:votes_for) }

  it { should validate_presence_of(:commentable_id) }
  it { should validate_presence_of(:commentable_type) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:text) }
end
