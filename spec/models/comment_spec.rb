require 'rails_helper'

describe Comment do
  it_should_behave_like 'trackable', :comment

  it { should belong_to(:user) }
  it { should belong_to(:commentable) }

  it_should_behave_like('likeable')

  it { should validate_presence_of(:commentable_id) }
  it { should validate_presence_of(:commentable_type) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:text) }

  it { should respond_to(:user_name) }
  it { should respond_to(:user_avatar) }
end
