require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
let(:my_question) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_question] to @questions" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end
    it "instiantiates new question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end

  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "it reneders edit template" do
      get :edit, {id: my_question.id}
      expect(response).to render_template :edit
    end
  end

  describe "PUT update" do
    it "updates post with exected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_resolved = true

      put :update, id: my_question.id, question: {title: new_title, body: new_body, resovled: new_resolved}

      updated_question = assigns (:question)
      expect(updated_question.id).to eq my_question.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body

    end
    it "redirects to the updated question" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_resolved = true

       put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: new_resolved}
       expect(response).to redirect_to my_question
     end
  end

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, {id: my_question}
      count = Question.where(id: my_question.id).size
      expect(count).to eq 0
    end
    it "redirects to posts" do
      delete :destroy, {id: my_question}
      expect(response).to redirect_to questions_path
    end

  end
end
