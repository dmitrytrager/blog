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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)

    flash[:notice] = "Article was updated"
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = User.first.articles.new(article_params)
    if @article.save
      flash[:notice] = "Article was created"
      redirect_to article_path(@article)
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
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
