class ArticlesController < ApplicationController

  before_action :set_articles, only:[:edit, :show,:update,:destroy]

  def searching
     @article = Article.params[:article]
    if @article.present?
      redirect_to(articles_path, alert: "not found")
    else
      # flash[:notice] = "search article successfully found"
      # render "searching"
      @parameter = params[:article].downcase
      @results = Article.all.where("lower(name) LIKE :article", article: @parameter)
      redirect_to searching_path
    end
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
     @article = current_user.articles.new(article_params)
     if @article.save
       flash[:notice] = "create article successfully"
       redirect_to article_path(@article)
     else
       render 'new'
     end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was succesfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def set_articles
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
