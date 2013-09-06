require 'spec_helper'

describe Like do
  it { should belong_to(:likeable).dependent(:destroy) }
end
