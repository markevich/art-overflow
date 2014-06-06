require 'spec_helper'

describe TagsController do
  describe '#index' do
    before do
      ActsAsTaggableOn::Tag.create!(name: 'test1')
      ActsAsTaggableOn::Tag.create!(name: '1test')
      ActsAsTaggableOn::Tag.create!(name: 'smth_other')
      get :index, format: :json, term: 'test'
    end

    it do
      expect(response.body).to eq ['test1', '1test'].to_json
    end
  end
end