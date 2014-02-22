require 'spec_helper'

describe RacesController do

  before (:each) do
    @race = FactoryGirl.create(:race)
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @race.id
      response.should be_success
    end

    it "should find the right race" do
      get :show, :id => @race.id
      assigns(:race).should == @race
    end
    
  end

end
