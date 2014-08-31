require 'rails_helper'

describe ActivityCollection::Manager do
  let(:activity1) { create(:activity, trackable: create(:like), key: 'like.create') }
  let(:activity2) { create(:activity, trackable: create(:follow), key: 'follow.create') }
  let(:activity3) { create(:activity, trackable: create(:picture), key: 'picture.create') }
  let(:activity4) { create(:activity, trackable: create(:comment), key: 'comment.create') }
  let(:collection_manager) { ActivityCollection::Manager.new([activity1, activity2, activity3, activity4]) }

  it { expect(collection_manager.count).to eq 4 }

  it do
    expect(collection_manager.map(&:class)).to include(
        ActivityCollection::Like,
        ActivityCollection::Follow,
        ActivityCollection::Picture,
        ActivityCollection::Comment
    )
  end
end
