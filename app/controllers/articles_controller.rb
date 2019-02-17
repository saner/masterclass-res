class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end

  def create
    cmd = Aggregates::CreateArticle.new(
      create_params.to_h.symbolize_keys.merge(article_id: SecureRandom.uuid)
    )

    command_bus.(cmd)

    redirect_to(
      article_path(Article.find_by_uid(cmd.article_id)),
      notice: 'Article was successfully created.'
    )
  end

  private

  def create_params
    params.require(:article).permit(:author, :title, :content)
  end
end
