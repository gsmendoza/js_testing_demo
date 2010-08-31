require 'spec_helper'

describe Song do
  before(:each) do
    @valid_attributes = {
      :artist => "value for artist",
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Song.create!(@valid_attributes)
  end
end
