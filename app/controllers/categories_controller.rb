class CategoriesController < ApplicationController

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "category successfully added"
            redirect_to categories_path
        else
            flash[:alert] = "category not added"
            render 'new'
        end
    end

    def index
        @categories = Category.all
    end
    
    # def show
    #     @categories = Category.find(params[:id])
    #     @category_articles = @category.articles
    # end





    private
    def category_params
        params.require(:category).permit(:name)
    end

end
