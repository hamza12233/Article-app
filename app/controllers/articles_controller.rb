class ArticlesController < ApplicationController

  before_action :set_articles, only:[:edit, :show,:update,:destroy]

  # def search  
  #   if params[:search].blank?  
  #     redirect_to(root_path, alert: "Empty field!") and return  
  #   else  
  #     @parameter = params[:search].downcase  
  #     @results = Article.all.where("lower(name) LIKE :search", search: @parameter)
  #     render "articles/searching"
  #   end  
  # end

  def index
    if current_user.admin?
    @articles = Article.all
    else
    @articles = Article.status_published
  end
end

  def published
    @article = Article.find(params[:id])
    @article.update_attributes(is_published: true)
    redirect_to articles_path
  end
  # def searching
  #    @article = Article.params[:article]
  #   if @article.present?
  #     redirect_to(articles_path, alert: "not found")
  #   else
  #     # flash[:notice] = "search article successfully found"
  #     # render "searching"
  #     @parameter = params[:article].downcase
  #     @results = Article.all.where("lower(name) LIKE :article", article: @parameter)
  #     redirect_to searching_path
  #   end
  # end

  def not_published
    @article = Article.find(params[:id])
    @article.update_attributes(is_published: false)
    redirect_to articles_path
  

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
