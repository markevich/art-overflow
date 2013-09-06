require 'spec_helper'

describe Picture do
  it { should belong_to(:user).dependent(:destroy) }
  it { should belong_to(:gallery).dependent(:destroy) }
  it { should have_many(:likes) }

  it_should_behave_like 'commentable'

  it { should respond_to(:tags) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:path) }
  it { should validate_presence_of(:user_id) }

end
