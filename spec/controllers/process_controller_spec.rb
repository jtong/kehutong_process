require "spec_helper"

describe ProcessController do
  describe "GET #handle" do
    it "responds successfully with an HTTP 200 status code" do
      get :handle
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.body).to eq "I am running"
    end

  end
end