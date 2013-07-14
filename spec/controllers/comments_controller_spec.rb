require 'spec_helper'

describe CommentsController do
  let(:user) { create(:user) }
  before { sign_in user }
  let(:pic) { create(:picture) }
  let(:comment) { create(:comment) }
  before do
    @request.env['HTTP_REFERER'] = picture_path(pic.id)
  end

  describe "#like" do
    def like_comment
      post :like, id: comment.id
      comment.reload
    end

    it { expect { like_comment }.to change(comment, :votes_for).by(1) }
    it { expect { like_comment }.to change(comment.activities, :count).by(1) }
    it { expect { like_comment }.to change(comment, :likes_count).by(1) }
    it { expect(post :like, id: comment.id).to redirect_to(picture_path(pic.id)) }
  end

  describe "#unlike" do
    before do
      post :like, id: comment.id
      comment.reload
    end

    def unlike_comment
      post :unlike, id: comment.id
      comment.reload
    end

    it { expect { unlike_comment }.to change(comment, :votes_for).by(-1) }
    it { expect { unlike_comment }.to change(comment.activities, :count).by(-1) }
    it { expect { unlike_comment }.to change(comment, :likes_count).by(-1) }
    it { expect(post :unlike, id: comment.id).to redirect_to(picture_path(pic.id)) }
  end
end
