require 'spec_helper'

describe SongsController do

  describe "GET 'show'" do
    it "unauthenticated search should fail" do
      get :search
      response.should_not be_success
    end
  end

end
