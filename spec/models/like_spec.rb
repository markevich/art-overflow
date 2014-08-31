require 'rails_helper'

describe Like do
  it_should_behave_like 'trackable', :like

  it { should belong_to(:user) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:likeable) }

  it { should respond_to(:user_name) }
  it { should respond_to(:user_avatar) }
end
