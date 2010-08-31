Given /^I have some songs$/ do
  Song.create(:artist => 'Mississippi John Hurt', :title => 'Candyman')
  Song.create(:artist => 'Robert Johnson', :title => 'Cross Road Blues')
  Song.create(:artist => 'Blind Lemon Jefferson', :title => 'Hot dogs')
end

When /^I view the Songs page$/ do
  visit songs_url
end

Then /^I should see the player widget$/ do
  document.css('.player').should have(1).player
end

Then /^I should see the songs$/ do
  document.css('.songs .song').should_not be_empty
end

Then /^the player widget should have buttons to play and pause the current song$/ do
  document.css('.player .action.play').should have(1).play_button
  document.css('.player .action.pause').should have(1).pause_button
end

Then /^there should be no song playing$/ do
  document.css('.player .artist .value').text.should be_blank
  document.css('.player .title .value').text.should be_blank
  document.css('.player .status .value').text.should be_blank
  document.css('.player .message .value').text.should be_blank
end

def document
  Nokogiri.HTML(page.body)
end
