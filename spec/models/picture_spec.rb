require 'spec_helper'

describe Picture do
  it { should belong_to(:user) }
  it { should belong_to(:gallery) }

  it_should_behave_like 'commentable'
  it_should_behave_like 'likeable'

  it { should respond_to(:tags) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }

  it { should respond_to(:user_name) }
end
