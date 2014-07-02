require 'spec_helper'

describe TagsController do
  describe '#index' do
    let(:picture) { create(:picture) }
    before do
      tag1 = ActsAsTaggableOn::Tag.create!(name: 'test1')
      ActsAsTaggableOn::Tagging.create!(tag: tag1, taggable: picture, context: 'tags')
      tag2 = ActsAsTaggableOn::Tag.create!(name: '1test')
      ActsAsTaggableOn::Tagging.create!(tag: tag2, taggable: picture, context: 'tags')
      tag3 = ActsAsTaggableOn::Tag.create!(name: 'smth_other')
      ActsAsTaggableOn::Tagging.create!(tag: tag3, taggable: picture, context: 'tags')
      category = ActsAsTaggableOn::Tag.create!(name: 'smth_other2')
      ActsAsTaggableOn::Tagging.create!(tag: category, taggable: picture, context: 'categories')
      get :index, format: :json, term: 'test'
    end

    it do
      expect(response.body).to eq ['test1', '1test'].to_json
    end
  end
end