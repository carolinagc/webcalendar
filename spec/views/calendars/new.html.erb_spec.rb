require 'spec_helper'

describe "calendars/new" do
  before(:each) do
    assign(:calendar, stub_model(Calendar,
      :url => "MyString",
      :user => nil,
      :title => "MyText"
    ).as_new_record)
  end

  it "renders new calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", calendars_path, "post" do
      assert_select "input#calendar_url[name=?]", "calendar[url]"
      assert_select "input#calendar_user[name=?]", "calendar[user]"
      assert_select "textarea#calendar_title[name=?]", "calendar[title]"
    end
  end
end
