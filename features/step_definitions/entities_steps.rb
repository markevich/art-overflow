Given /^drawing category "(.*?)"$/ do |name|
  create(:drawing_category, name: name)
end

Given /^picture "(.*?)" exist$/ do |path|
  DrawingUploader.any_instance.stub(:download!)
end