class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article, notice: 'Article was succesfull created'
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was succesfull updated'
    else
      render :edit
    end
  end

  def destroy
    @article.delete
    redirect_to articles_path, notice: 'Article was succesfull deleted'
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
