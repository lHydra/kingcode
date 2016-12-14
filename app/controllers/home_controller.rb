class HomeController < ApplicationController
  def index
    @articles = Article.last(3)
    @projects = Project.last(3)
  end
end
