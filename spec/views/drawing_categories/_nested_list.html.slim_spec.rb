require 'spec_helper'

describe 'drawing_categories/nested_list.html.slim' do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  before do
    create_categories
  end
  let(:categories) { DrawingCategory.scoped }
  let(:category_names) { categories.map &:name }

  it 'should render each category' do
    render_partial categories
    category_names.each {|name| page.should have_content name}
  end

  it 'should mark current category' do
    current_category = categories[1]
    render_partial categories, current_category
    rendered.should have_xpath "//li[@class='category_active']/a[. ='#{current_category.name}']"
  end

  context 'nesting' do
    before do
      create_subcategories
      render_partial categories
    end
    it 'should nest 3 items overall' do
      rendered.should have_xpath "//div", count: 3
    end

    it 'should nest 1 item 2 level deep' do
      rendered.should have_xpath "//div[@class='nested_categories']/div[@class='nested_categories']", count: 1
    end
  end
  
end

def render_partial categories, current = nil
  render partial: 'drawing_categories/nested_list', locals: {categories: categories, current_category: current}
end

def create_categories
  create(:drawing_category)
  create(:drawing_category)
  create(:drawing_category)
end

def create_subcategories
  second_level = create(:drawing_category, parent_id: categories.first.id)
  create(:drawing_category, parent_id: second_level.id)

  create(:drawing_category, parent_id: categories[1].id)
end
