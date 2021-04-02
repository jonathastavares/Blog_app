require_relative 'users_controller.rb'
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article[:user_id] = session[:user_id]
    if @article.save
      flash[:success] = 'Article was created sucessfully!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was updated sucessfully!'
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article was deleted!'
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
