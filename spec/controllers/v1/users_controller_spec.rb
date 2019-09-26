require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do

  describe "POST #create" do

    it "returns http unprocessable_entity" do
      post :create
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns http created" do
      post :create, params: {email: 'test@email.com', password: '123123123'}
      expect(response).to have_http_status(:created)
    end
  end
end
