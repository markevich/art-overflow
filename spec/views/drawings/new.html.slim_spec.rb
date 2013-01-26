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
    it { page.should have_select('drawing_drawing_category_id', with_options: [DrawingCategory.first.name]) }
    it { page.should have_field 'Тэги' }
    it { page.should have_field 'Изображение с компьютера' }
    it { page.should have_field 'Изображение с интернета' }
    it { page.should have_button 'Сохранить' }
  end
  
end