require 'rails_helper'

RSpec.describe FeedsController, type: :controller do

  describe "GET #index" do
    it "assigns @feeds" do
      create_feed = create_list(:feed, 5).reverse

      get :index
      expect(assigns(:feeds)).to eq(create_feed)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new rss feed" do
        param = {feed: FactoryBot.attributes_for(:feed)}
        expect{post :create, params: param}.to change(Feed, :count).by(1)
      end
    end
  end
end
