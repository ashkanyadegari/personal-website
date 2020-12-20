class PagesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @articles = Article.last(3).reverse
    @profile = Page.find_by_title("profile")
    @skills = Page.find_by_title("skills")
    @projects = Article.where(project: true)
  end

  def new
    @page = Page.new()
  end

  def create
    @page = Page.new(page_params)
    @page.save
    redirect_to root_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :content, :tags)
  end

  def set_article
    @page = Page.find(params[:id])
    authorize @page
  end

end
