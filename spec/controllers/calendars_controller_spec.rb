require 'spec_helper'

describe CalendarsController do
  let(:valid_attributes) { { title: "Some title", user_id: FactoryGirl.create(:user).id } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all calendars as @calendars" do
      calendar = Calendar.create! valid_attributes
      get :index, {}, valid_session
      assigns(:calendars).should eq([calendar])
    end
  end

  describe "GET show" do
    it "assigns the requested calendar as @calendar" do
      calendar = Calendar.create! valid_attributes
      get :show, {:id => calendar.to_param}, valid_session
      assigns(:calendar).should eq(calendar)
    end

    it "assigns the related events as @events" do
      calendar = Calendar.create! valid_attributes
      calendar.events = FactoryGirl.build_list(:event, 2, calendar: calendar)
      get :show, {:id => calendar.to_param}, valid_session
      assigns(:events).should eq(calendar.events)
    end
  end

  describe "GET new" do
    it "assigns a new calendar as @calendar" do
      get :new, {}, valid_session
      assigns(:calendar).should be_a_new(Calendar)
    end
  end

  describe "GET edit" do
    it "assigns the requested calendar as @calendar" do
      calendar = Calendar.create! valid_attributes
      get :edit, {:id => calendar.to_param}, valid_session
      assigns(:calendar).should eq(calendar)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Calendar" do
        expect {
          post :create, {:calendar => valid_attributes}, valid_session
        }.to change(Calendar, :count).by(1)
      end

      it "assigns a newly created calendar as @calendar" do
        post :create, {:calendar => valid_attributes}, valid_session
        assigns(:calendar).should be_a(Calendar)
        assigns(:calendar).should be_persisted
      end

      it "redirects to the created calendar" do
        post :create, {:calendar => valid_attributes}, valid_session
        response.should redirect_to(Calendar.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved calendar as @calendar" do
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        post :create, {:calendar => { "title" => "invalid value" }}, valid_session
        assigns(:calendar).should be_a_new(Calendar)
        end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        post :create, {:calendar => { "title" => "invalid value" }}, valid_session
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
        put :update, {:id => calendar.to_param, :calendar => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested calendar as @calendar" do
        calendar = Calendar.create! valid_attributes
        # put :update, {:id => calendar.to_param, :calendar => valid_attributes}, valid_session
        put :update, {id: calendar.to_param, calendar: { title: "test", user: FactoryGirl.build(:user) }}, valid_session
        assigns(:calendar).should eq(calendar)
      end

      it "redirects to the calendar" do
        calendar = Calendar.create! valid_attributes
        # put :update, {id: calendar.to_param, calendar: valid_attributes}, valid_session
        put :update, {id: calendar.to_param, calendar: { title: "test", user: FactoryGirl.build(:user) }}, valid_session
        response.should redirect_to(calendar)
      end
    end

    describe "with invalid params" do
      it "assigns the calendar as @calendar" do
        calendar = Calendar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        put :update, {:id => calendar.to_param, :calendar => { "title" => "invalid value" }}, valid_session
        assigns(:calendar).should eq(calendar)
      end

      it "re-renders the 'edit' template" do
        calendar = Calendar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Calendar.any_instance.stub(:save).and_return(false)
        put :update, {:id => calendar.to_param, :calendar => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested calendar" do
      calendar = Calendar.create! valid_attributes
      expect {
        delete :destroy, {:id => calendar.to_param}, valid_session
      }.to change(Calendar, :count).by(-1)
    end

    it "redirects to the calendars list" do
      calendar = Calendar.create! valid_attributes
      delete :destroy, {:id => calendar.to_param}, valid_session
      response.should redirect_to(calendars_url)
    end
  end
end
