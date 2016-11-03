class ArticlesController < ApplicationController
  helper_method :my_sum
  before_action :check_login

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

  def check_login
  end
end
