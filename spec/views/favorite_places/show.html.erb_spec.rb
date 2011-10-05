require 'spec_helper'

describe "favorite_places/show.html.erb" do
  before(:each) do
    @favorite_place = assign(:favorite_place, stub_model(FavoritePlace,
      :name => "Name",
      :street => "",
      :city => "City"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
  end
end
