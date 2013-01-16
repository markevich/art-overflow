require 'spec_helper'

describe 'drawing_categories/_list.html.slim' do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  let(:categories) { create_categories }
  let(:category_names) { categories.map &:name }

  it 'should render each category' do
    render_partial categories
    category_names.each {|name| page.should have_text name}
  end

  it 'should mark current category' do
    current_category = categories[1]
    render_partial categories, current_category
    rendered.should have_xpath "//li[@class='category_active']/a[. ='#{current_category.name}']"
  end

end

def render_partial categories, current = nil
  render partial: 'drawing_categories/list', locals: {categories: categories, current_category: current}
end

def create_categories
  [
  create(:drawing_category),
  create(:drawing_category)
  ]
end