require 'spec_helper'

describe CommentsController do
  let(:user) { create(:user) }
  before { sign_in user }
  let(:pic) { create(:picture) }
  let(:comment) { create(:comment) }
  before { @request.env['HTTP_REFERER'] = picture_path(pic.id) }

  describe "#like" do
    it { expect { post :like, id: comment.id }.to change(comment, :votes_for).by(1) }
    it { expect { post :like, id: comment.id }.to change(comment.activities, :count).by(1) }
    it { expect(post :like, id: comment.id).to redirect_to(picture_path(pic.id)) }
  end  

  describe "#unlike" do
    before { post :like, id: comment.id }
    it { expect { post :unlike, id: comment.id }.to change(comment, :votes_for).by(-1) }
    it { expect { post :unlike, id: comment.id }.to change(comment.activities, :count).by(-1) }
    it { expect(post :unlike, id: comment.id).to redirect_to(picture_path(pic.id)) }
  end
end