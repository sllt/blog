class Admin::ArticlesController < Admin::ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_path, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_articles_path, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 15)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :back
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end