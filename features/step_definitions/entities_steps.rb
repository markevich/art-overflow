Given /^drawing category "(.*?)"$/ do |name|
  create(:drawing_category, name: name)
end
