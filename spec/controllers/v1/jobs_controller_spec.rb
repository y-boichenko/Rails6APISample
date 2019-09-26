require 'rails_helper'

RSpec.describe V1::JobsController, type: :controller do

  let(:token) { double :acceptable? => true }
  let(:job) { create(:job) }

  describe "GET #index" do
    describe "Authorized" do
      before do
        allow(controller).to receive(:doorkeeper_token) { token }
      end
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end
    it "return unauthorized" do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET #show" do
    describe "Authorized" do
      before do
        allow(controller).to receive(:doorkeeper_token) { token }
      end
      it "returns http success" do
        get :show, params: {id: job.id}
        expect(response).to have_http_status(:ok)
      end
      it "returns http error" do
        get :show, params: {id: 1005000}
        expect(response).to have_http_status(:not_found)
      end
    end
    it "return unauthorized" do
      get :show, params: {id: job.id}
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
