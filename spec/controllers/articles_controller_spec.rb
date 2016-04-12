require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    it "respond successfully with http 200 status code" do
      visit articles_path
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "respond successfully with HTTP 200 status code" do
      article = Article.create!(title: "hello", content: "hello!")
      visit article_path(article)
      expect(response).to be_success
    end
  end

end
