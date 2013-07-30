require 'spec_helper'

describe "Essays" do
  describe "GET /essays" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get essays_path
      response.status.should be(200)
    end
  end
end
