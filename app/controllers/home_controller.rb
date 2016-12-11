class HomeController < ApplicationController
  def index
    @articles = Article.last(3)
  end
end
