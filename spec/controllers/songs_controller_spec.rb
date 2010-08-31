require 'spec_helper'

describe SongsController do
  integrate_views

  def mock_song(stubs={})
    @mock_song ||= mock_model(Song, stubs)
  end

  describe "GET index" do
    it "assigns all songs as @songs" do
      Song.stub(:find).with(:all).and_return([mock_song(:artist => 'Mississippi John Hurt', :title => 'Candyman')])
      get :index
      response.should be_success
      assigns[:songs].should == [mock_song]
    end
  end

  it "generates a fixture for the users index page" do
    Song.delete_all

    Song.create(:artist => 'Mississippi John Hurt', :title => 'Candyman')
    Song.create(:artist => 'Robert Johnson', :title => 'Cross Road Blues')
    Song.create(:artist => 'Blind Lemon Jefferson', :title => 'Hot dogs')

    Song.count.should == 3

    get :index
    response.should be_success
    save_fixture(html_for('body'), 'songs-index')
  end
end
