require 'spec_helper'

describe Organizer do
  before do
    @organizer = FactoryGirl.build(:organizer)
  end

  it "should have a name" do
    expect(@organizer.name).to be_present
  end

  it 'should be invalid if no name is present' do
    expect(Organizer.new).to be_invalid
  end

  it { should respond_to(:url) }

  describe "when url format is valid" do
    it "should be valid" do
      @organizer = Organizer.new(:name => "OTS")
      urls = %w[http://www.google.com/ http://www.another.valid.url.com/ http://www.another-valid-url.com/]
      urls.each do |valid_url|
        @organizer.url = valid_url
        expect(@organizer).to be_valid
      end
    end
  end

  describe "when url format is invalid" do
    it "should be invalid" do
      @organizer = Organizer.new(:name => "OTS")
      urls = %w["www..google..com" "http://www.an invalid url.com/" "http://www.an+invalid+url.com/"]
      urls.each do |invalid_url|
        @organizer.url = invalid_url
        expect(@organizer).not_to be_valid
      end
    end
  end

end
