require 'rails_helper'

RSpec.describe "Foods", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/foods/index"
      expect(response).to have_http_status(:success)
    end
  end

end
