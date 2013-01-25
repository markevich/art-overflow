#encoding: utf-8
require 'spec_helper'

describe 'drawings/new.html.slim' do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  before { assign(:drawing, Drawing.new) }
  context 'presence' do
    before do
      render
      create(:drawing_category)
    end
    it { page.should have_field 'Имя' }
    it { page.should have_select('drawing_drawing_category', with_options: [DrawingCategory.first.name]) }
    it { page.should have_field 'Тэги' }
  end
  
end