require 'rails_helper'
require 'spec_helper'

describe MenteesController do
  describe "GET #show" do
    it "assigns the requested mentee to mentee" do
      mentee = create(:mentee)
      get :show, params: { id: mentee.id }
      expect(assigns(:mentee)).to eq(mentee)
    end

    it "renders the :show template" do
      get :show, params: { id: FactoryBot.create(:mentee) }
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Mentee to @mentee" do
      get :new
      expect(assigns(:mentee)).to be_kind_of(Mentee)
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new mentee in the database" do
        expect {
          post :create, params: { mentee: FactoryBot.attributes_for(:mentee) }
        }.to change(Mentee,:count).by(1)
      end

      it "redirects to the mentee profile page" do
        post :create, params: { mentee: FactoryBot.attributes_for(:mentee) }
        response.should redirect_to Mentee.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new mentee in the database" do
        expect {
          post :create, params: { mentee: FactoryBot.attributes_for(:invalid_mentee) }
        }.to_not change(Mentee,:count)
      end

      it "re-renders the :new template" do
        post :create, params: { mentee: FactoryBot.attributes_for(:invalid_mentee) }
        response.should render_template :new
      end
    end
  end
end
