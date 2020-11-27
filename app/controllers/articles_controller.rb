class ArticlesController < ApplicationController
  before_action :set_articles, only: %i[edit show update destroy]
  respond_to :html, :js

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
    @articles = if current_user.admin?
                  Article.all
                else
                  Article.status_published
                end
  end

  def published
    @article = Article.find(params[:id])
    @article.update_attributes(is_published: true)
    respond_to do |format|
       format.html { redirect_to articles_url  , notice: 'Article was successfully published  ' }
       # format.html { redirect_to articles_path, alert: 'not published'}
    end
    # redirect_to articles_path
  end

  def not_published
    @article = Article.find(params[:id])
    @article.update_attributes(is_published: false)
    respond_to do |format|
      format.html { redirect_to articles_url  , alert: 'Article was  unpublished  ' }
      # format.html { redirect_to articles_path, alert: 'not published'}
    end
    # redirect_to articles_path
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

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = 'create article successfully'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was succesfully edited'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def set_articles
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids:[])
  end
end
