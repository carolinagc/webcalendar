require 'spec_helper'

describe "calendars/index" do
  before(:each) do
    assign(:calendars, [
      stub_model(Calendar,
        :url => "Url",
        :user => nil,
        :title => "MyText"
      ),
      stub_model(Calendar,
        :url => "Url",
        :user => nil,
        :title => "MyText"
      )
    ])
  end

  it "renders a list of calendars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
