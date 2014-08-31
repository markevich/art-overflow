require 'rails_helper'

describe NotificationSettings do
  it { should belong_to(:user) }
end
