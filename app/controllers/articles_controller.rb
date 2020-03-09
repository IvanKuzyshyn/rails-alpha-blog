class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :show]

  def index
    articles = Article.all
    render_json(articles)
  end

  def show
    render_json(@article)
  end

  def create
  end

  def update
  end

  def destroy
    if @article.destroy
      render json: {}, status: :no_content
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find([params[:id]])
  end
end
