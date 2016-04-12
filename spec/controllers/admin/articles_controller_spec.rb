require 'rails_helper'

RSpec.describe Admin::ArticlesController, type: :controller do

  describe "GET #index" do
    it "should respond successfully with HTTP 200 status code" do
      visit admin_articles_path
      expect(response).to be_success
    end
  end

  describe "DELETE #destroy" do
    it "destroys requested article" do
      article = Article.create!(title: "Hello", content: "hello")
      expect {
        delete :destroy, { :id => article.to_param }
      }.to change(Article, :count).by(-1)
    end
    it "redirect to admin_articles_path when article destroy" do
      article = Article.create!(title: "Hello", content: "hello")
      delete :destroy, { :id => article.to_param }
      response.should redirect_to(admin_articles_path)
    end
  end
end