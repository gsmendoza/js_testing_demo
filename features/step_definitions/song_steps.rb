Given /^I am in the Songs page$/ do
  visit songs_path
end

Given /^I have some songs$/ do
  Song.create(:artist => 'Mississippi John Hurt', :title => 'Candyman')
  Song.create(:artist => 'Robert Johnson', :title => 'Cross Road Blues')
  Song.create(:artist => 'Blind Lemon Jefferson', :title => 'Hot dogs')
end

Given /^no song is playing$/ do
  document.css('.player .field .artist').text.should be_blank
  document.css('.player .field .title').text.should be_blank
  document.css('.player .field .status').text.should be_blank
  document.css('.player .field .message').text.should be_blank
end

Given /^song A is playing$/ do
  song_title = document.css('.player .song .title')[0].text
  song_title.should_not be_blank

  click_link song_title
end

When /^I click the Pause button$/ do
  click_button 'Pause'
end

When /^I click a song$/ do
  song_title = document.css('.player .song .title')[0].text
  song_title.should_not be_blank

  click_link song_title
end

When /^I click song B$/ do
  song_title = document.css('.player .song .title')[1].text
  song_title.should_not be_blank

  click_link song_title
end

When /^I view the Songs page$/ do
  visit songs_path
end

Then /^I should see the player widget$/ do
  document.css('.player').should have(1).player
end

Then /^I should see that the song is playing$/ do
  document.css('.player .field .artist').text.should_not be_blank
  document.css('.player .field .title').text.should_not be_blank
  document.css('.player .field .status').text.should == 'Playing'
  document.css('.player .field .message').text.should be_blank
end

Then /^I should see that song A is paused$/ do
  song_title = document.css('.player .song .title')[0].text

  document.css('.player .field .title').text.should == song_title
  document.css('.player .field .status').text.should == 'Paused'
end

Then /^I should see that song B is playing$/ do
  song_title = document.css('.player .song .title')[1].text
  document.css('.player .field .title').text.should == song_title
end
Then /^I should see the songs$/ do
  document.css('.player .songs .song').should_not be_empty
end

Then /^the player widget should have buttons to play and pause the current song$/ do
  document.css('.player .controls .action.resume').should have(1).play_button
  document.css('.player .controls .action.pause').should have(1).pause_button
end

Then /^there should be no song playing$/ do
  document.css('.player .field .artist').text.should be_blank
  document.css('.player .field .title').text.should be_blank
  document.css('.player .field .status').text.should be_blank
  document.css('.player .field .message').text.should be_blank
end

def document
  Nokogiri.HTML(page.body)
end
