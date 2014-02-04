require 'spec_helper'

describe "calendars/edit" do
  before(:each) do
    @calendar = assign(:calendar, stub_model(Calendar,
      :url => "MyString",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders the edit calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", calendar_path(@calendar), "post" do
      assert_select "input#calendar_url[name=?]", "calendar[url]"
      assert_select "input#calendar_user[name=?]", "calendar[user]"
      assert_select "textarea#calendar_title[name=?]", "calendar[title]"
    end
  end
end
