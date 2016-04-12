require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it "works! (now write some real specs)" do
      get articles_path
      expect(response).to have_http_status(200)
    end

    it "displays menu" do
      visit articles_path
      expect(page).to have_selector("nav.menu")
    end
  end

  describe "GET /articles/new" do
    it "displays the 'successfully' after new article" do
      visit new_article_path
      fill_in 'Title', :with => "hello"
      fill_in 'Content', :with => "hello"
      click_button 'Create Article'
      expect(page).to have_content("successfully")
    end
  end

  describe "GET /articles/:id" do
    it "displays title and content" do
      article = Article.create!(title:"test article", content: "test article content")
      visit article_path(article)
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.content)
    end
  end
end
