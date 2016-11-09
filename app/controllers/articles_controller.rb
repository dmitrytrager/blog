class ArticlesController < ApplicationController
  helper_method :my_sum
  before_action :check_login
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params) 
    if @article.save
      flash[:success] = "Статья успешно создана"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @articles = [
      {
        title: "First article",
        body: "Body!"
      }
    ]
    render "index"
  end

  def my_sum(a, b)
    a + b
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def check_login
    end
end
