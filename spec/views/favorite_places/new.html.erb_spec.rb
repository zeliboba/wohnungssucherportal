require 'spec_helper'

describe "favorite_places/new.html.erb" do
  before(:each) do
    assign(:favorite_place, stub_model(FavoritePlace,
      :name => "MyString",
      :street => "",
      :city => "MyString"
    ).as_new_record)
  end

  it "renders new favorite_place form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favorite_places_path, :method => "post" do
      assert_select "input#favorite_place_name", :name => "favorite_place[name]"
      assert_select "input#favorite_place_street", :name => "favorite_place[street]"
      assert_select "input#favorite_place_city", :name => "favorite_place[city]"
    end
  end
end
