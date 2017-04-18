require 'rails_helper'

RSpec.describe AdvertismentsController, type: :controller do
let(:my_advertisment) {Advertisment.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25)}


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisment] to @advertisments" do
      get :index
      expect(assigns(:advertisments)).to eq([my_advertisment])
    end
  end



  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end

    it "instanitates @advertisment" do
      get :new
      expect(assigns(:advertisment)).not_to be_nil
    end
  end
  #
  describe "GET #create" do


    it "increases the number of Advertisments by 1" do
      expect{advertisment :create, advertisment: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number(25)}}.to change(Advertisment,:count).by(1)
    end

  end

end
