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
      assigns[:songs].should == [mock_song]
    end
  end
end
