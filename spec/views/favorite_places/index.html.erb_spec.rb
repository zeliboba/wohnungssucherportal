require 'spec_helper'

describe "favorite_places/index.html.erb" do
  before(:each) do
    assign(:favorite_places, [
      stub_model(FavoritePlace,
        :name => "Name",
        :street => "",
        :city => "City"
      ),
      stub_model(FavoritePlace,
        :name => "Name",
        :street => "",
        :city => "City"
      )
    ])
  end

  it "renders a list of favorite_places" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
