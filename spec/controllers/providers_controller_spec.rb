require "rails_helper"

RSpec.describe ProvidersController, :type => :controller do
  let(:provider){ FactoryGirl.create(:user, roles: 'provider' ) }
  before(:each) do
    sign_in provider
  end
  
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the requests into @requests" do
      request1, request2 = Request.create(user_id: provider.id), Request.create(user_id: provider.id)
      get :index

      expect(assigns(:requests)).to match_array([request1, request2])
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: provider.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, id: provider.id
      expect(response).to render_template("show")
    end

    it "assigns quote table variables" do
      QuoteTable.create(desc: 'test', user_id: provider.id)
      quote_table = QuoteTable.where(user_id: provider.id)
      get :show, id: provider.id
      expect(assigns(:quote_tables)).to eq(quote_table)
    end
  end
end