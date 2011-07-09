require 'spec_helper'

describe VisitsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

end
