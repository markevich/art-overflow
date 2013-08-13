require 'spec_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:picture) { create(:picture) }

  before do
    sign_in(user)
    request.env["HTTP_REFERER"] = pictures_path
  end

  context '.create' do
    let(:params) {
      {comment: {text: 'My comment', commentable_id: picture.id, commentable_type: picture.class.to_s}}
    }

    it { expect { post :create, params }.to change(picture.comments, :count).by(1) }
  end

  context '.like' do
    let!(:comment) { create(:comment, commentable_type: picture.class.to_s, commentable_id: picture.id) }

    it { expect { post :like, id: comment.id }.to change(comment, :votes_for).by(1) }
  end

  context '.like' do
    let!(:comment) { create(:comment, commentable_type: picture.class.to_s, commentable_id: picture.id) }
    before { user.vote_for(comment) }

    it { expect { post :unlike, id: comment.id }.to change(comment, :votes_for).by(-1) }
  end
end
