require 'spec_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:picture) { create(:picture) }

  before do
    sign_in(user)
    request.env["HTTP_REFERER"] = pictures_path
  end

  context '#create' do
    let(:params) {
      {comment: {text: 'My comment', commentable_id: picture.id, commentable_type: picture.class.to_s}}
    }

    it { expect { post :create, params }.to change(picture.comments, :count).by(1) }
  end

  it_behaves_like 'destroy action' do
    let(:comment) { create(:comment, commentable: picture) }
    let(:params) { {id: comment.id} }
  end
end
