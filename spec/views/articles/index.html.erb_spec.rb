require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Article.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "div.conteudo>h1", :text => "Title".to_s, :count => 2
  end

  it "renders _article partial for each article" do 
    render
    expect(view).to render_template(:partial => "_article", :count => 2)
  end
end
