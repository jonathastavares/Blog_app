class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success]
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        set_article
    end

    def edit
        set_article
    end

    def update
        set_article
        if @article.update(article_params)
            flash[:success]
            redirect_to articles_path(@article)
        else
            flash[:notice] = "Article was not updated"
            render 'edit'
        end
      end

    def index
        @articles = Article.all
    end

    def destroy
        set_article
        @article.destroy
        flash[:success]
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end

        def set_article
            @article = Article.find(params[:id])
        end
end
