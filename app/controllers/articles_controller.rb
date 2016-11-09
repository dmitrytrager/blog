class ArticlesController < ApplicationController
  helper_method :my_sum
  before_action :check_login

  def index
    @articles = Article.all.order(created_at: :desc)

    render "index"
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])
    @atricle.update_attributes(article_params)
  end

  def new
  end

  def create
  end

  def destroy
    @article = Article.find(params[:id])
  end

  def my_sum(a, b)
    a + b
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def check_login
  end
end
