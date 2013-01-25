#encoding: utf-8
require 'spec_helper'

describe 'drawings/new.html.slim' do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  before { assign(:drawing, Drawing.new) }
  context 'presence' do
    before { render }
    it { page.should have_field 'Имя' }
  end
  
end