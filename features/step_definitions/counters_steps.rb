When(/^I click to likes counter link$/) do
  within '.like-button' do
    find('.counter-container').click
  end
end

Then(/^I should see link to my profile$/) do
  expect(page).to have_content(current_user.name)
  expect(page).to have_link("", href: user_pictures_path(current_user))
end

When(/^I click to follow counter link$/) do
  within '.follow-button' do
    find('.counter-container').click
  end
end

When(/^I click to followers counter link$/) do
  within '.followers' do
    find('.count').click
  end
end

When(/^I click to follows counter link$/) do
  within '.follows' do
    find('.count').click
  end
end

Given(/^Another user follows me$/) do
  another_user.follow(current_user)
end
