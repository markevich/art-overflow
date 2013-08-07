require 'spec_helper'

describe Picture do
  it { should belong_to(:user) }
  it { should belong_to(:gallery) }

  it_should_behave_like 'commentable'

  it { should respond_to(:tags) }
  it { should respond_to(:votes_for) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:path) }
  it { should validate_presence_of(:user_id) }

end
