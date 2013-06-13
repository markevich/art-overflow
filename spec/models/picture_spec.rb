require 'spec_helper'

describe Picture do
  it { should belong_to(:user) }
  it { should respond_to(:tags) }
end