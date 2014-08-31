require 'rails_helper'

describe LikesController do
  let(:user) { create(:user) }
  before { sign_in user }

  context 'picture' do
    describe "#destroy" do
      let(:pic) { create(:picture) }

      before { user.likes.create!(likeable: pic)}

      it 'returns likes count' do
        delete :destroy, picture_id: pic.id

        expect(pic.reload.likes_count).to eq 0
        expect(response.body).to eq({count: pic.likes_count, state: :inactive}.to_json)
      end
    end

    describe "#create" do
      let(:pic) { create(:picture) }
      it 'changes likes count' do
        post :create, picture_id: pic.id

        expect(pic.reload.likes_count).to eq 1
        expect(response.body).to eq({count: pic.likes_count, state: :active}.to_json)
      end
    end
  end

  context 'comment' do
    describe "#destroy" do
      let(:comment) { create(:comment) }

      before { user.likes.create!(likeable: comment)}

      it 'returns likes count' do
        delete :destroy, comment_id: comment.id

        expect(comment.reload.likes_count).to eq 0
        expect(response.body).to eq({count: comment.likes_count, state: :inactive}.to_json)
      end
    end

    describe "#create" do
      let(:comment) { create(:comment) }
      it 'changes likes count' do
        post :create, comment_id: comment.id

        expect(comment.reload.likes_count).to eq 1
        expect(response.body).to eq({count: comment.likes_count, state: :active}.to_json)
      end
    end

  end
end
