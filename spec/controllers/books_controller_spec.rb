require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  describe "GET search" do
    it "returns http success" do
      get :search
      expect(response).to be_success
    end
  end

end
