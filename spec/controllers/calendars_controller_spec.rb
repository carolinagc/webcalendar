require 'spec_helper'

describe CalendarsController do
  # TODO: Convert to expect syntax
  before :each do
    user_sign_in
  end

  let(:valid_attributes) { { title: "Some title", user_id: @user.id } }

  describe "GET index" do
    it "assigns all calendars as @calendars" do
      calendar = Calendar.create! valid_attributes
      get :index, {}
      assigns(:calendars).should eq([calendar])
    end
  end

  describe "GET show" do
    it "assigns the requested calendar as @calendar" do
      calendar = Calendar.create! valid_attributes
      get :show, {token: calendar.token}
      assigns(:calendar).should eq(calendar)
    end

    it "assigns the related events as @events" do
      calendar = Calendar.create! valid_attributes
      FactoryGirl.create(:event, calendar: calendar)
      get :show, {token: calendar.token}
      expect([assigns(:events)]).to include(calendar.events)
    end
  end

  describe "GET new" do
    it "assigns a new calendar as @calendar" do
      get :new, {}
      assigns(:calendar).should be_a_new(Calendar)
    end
  end

  describe "GET edit" do
    it "assigns the requested calendar as @calendar" do
      calendar = Calendar.create! valid_attributes
      get :edit, {token: calendar.token}
      assigns(:calendar).should eq(calendar)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Calendar" do
        expect {
          post :create, {:calendar => valid_attributes}
        }.to change(Calendar, :count).by(1)
      end

      it "assigns a newly created calendar as @calendar" do
        post :create, {:calendar => valid_attributes}
        assigns(:calendar).should be_a(Calendar)
        assigns(:calendar).should be_persisted
      end

      it "redirects to the created calendar" do
        post :create, {:calendar => valid_attributes}
        response.should redirect_to(Calendar.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved calendar as @calendar" do
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        post :create, {:calendar => { "title" => "invalid value" }}
        assigns(:calendar).should be_a_new(Calendar)
        end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        post :create, {:calendar => { "title" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested calendar" do
        calendar = Calendar.create! valid_attributes
        # Assuming there are no other calendars in the database, this
        # specifies that the Calendar created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Calendar.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {token: calendar.token, :calendar => { "title" => "MyString" }}
      end

      it "assigns the requested calendar as @calendar" do
        calendar = Calendar.create! valid_attributes
        put :update, {token: calendar.token, calendar: { title: "test", user: FactoryGirl.build(:user) }}
        assigns(:calendar).should eq(calendar)
      end

      it "redirects to the calendar" do
        calendar = Calendar.create! valid_attributes
        put :update, {token: calendar.token, calendar: { title: "test", user: FactoryGirl.build(:user) }}
        response.should redirect_to(calendar)
      end
    end

    describe "with invalid params" do
      it "assigns the calendar as @calendar" do
        calendar = Calendar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        put :update, {token: calendar.token, :calendar => { "title" => "invalid value" }}
        assigns(:calendar).should eq(calendar)
      end

      it "re-renders the 'edit' template" do
        calendar = Calendar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        put :update, {token: calendar.token, :calendar => { "title" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested calendar" do
      calendar = Calendar.create! valid_attributes
      expect {
        delete :destroy, {token: calendar.token}
      }.to change(Calendar, :count).by(-1)
    end

    it "redirects to the calendars list" do
      calendar = Calendar.create! valid_attributes
      delete :destroy, {token: calendar.token}
      response.should redirect_to(calendars_url)
    end
  end

  def user_sign_in
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
end
