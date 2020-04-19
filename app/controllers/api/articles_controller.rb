class Api::ArticlesController < ApplicationController
  before_action :set_article, only: %i[destroy show update]

  def index
    articles = Article.paginate(page: params[:page], per_page: 10)

    render_json(articles)
  end

  def show
    render_json(@article)
  end

  def create
    article = Article.new(article_params)

    if article.save
      render_json(article)
    else
      render_errors(article)
    end
  end

  def update
    if @article.update(article_params)
      render_json(@article)
    else
      render_errors(@article)
    end
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
    @article = Article.find(params[:id])
  end

  def article_params
    puts params.inspect
    params.permit(:title, :description, :user_id, category_ids: [])
  end
end
