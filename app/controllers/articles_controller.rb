class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @articles = Article.all
    if params[:query].present?
      @articles = policy_scope(Article).search_by_title_and_body(params[:query])
    else
      @articles = policy_scope(Article)
    end
  end

  def show
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :rich_body, :tag_list, photos: [])
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
end
