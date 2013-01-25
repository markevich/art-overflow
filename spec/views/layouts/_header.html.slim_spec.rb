#encoding: utf-8
require 'spec_helper'

describe 'layouts/_header.html.slim' do
  let(:page) { Capybara::Node::Simple.new(rendered) }

  it "should render 'Добавить рисунок' link if user authorized" do
    user = create(:user)
    view.stub(:current_user).and_return user
    view.stub(:user_signed_in?).and_return true
    render
    page.should have_content "Добавить рисунок"
  end

  it "should not render 'Добавить рисунок' link if user not authorized" do
    view.stub(:user_signed_in?).and_return false
    render
    page.should_not have_content "Добавить рисунок"
  end
end
