require 'rails_helper'
require 'spec_helper'

describe MentorsController do
  describe "GET #show" do
    it "assigns the requested mentor to mentor" do
      mentor = FactoryBot.create(:mentor)
      get :show, params: { id: mentor }
      assigns(:mentor).should eq(mentor)
    end

    it "renders the :show template" do
      get :show, params: { id: FactoryBot.create(:mentor) }
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Mentor to @mentor" do
      get :new
      expect(assigns(:mentor)).to be_kind_of(Mentor)
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new mentor in the database" do
        expect {
          post :create, params: { mentor: FactoryBot.attributes_for(:mentor) }
        }.to change(Mentor,:count).by(1)
      end

      it "redirects to the mentor profile page" do
        post :create, params: { mentor: FactoryBot.attributes_for(:mentor) }
        response.should redirect_to Mentor.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new mentor in the database" do
        expect {
          post :create, params: { mentor: FactoryBot.attributes_for(:invalid_mentor) }
        }.to_not change(Mentor,:count)
      end

      it "re-renders the :new template" do
        post :create, params: { mentor: FactoryBot.attributes_for(:invalid_mentor) }
        response.should render_template :new
      end
    end
  end
end
