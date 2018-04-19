class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.paginatedef(params[:page])

    render json: @articles
  end
  
  def belongsuser
    @articles = Article.belongsuserid(params[:user_id])
    render json: @articles
  end

  # GET /articles/:id
  def show
    @article = article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

      if @article.save
      render json: @article, status: :created, location: @article
      else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @article.update(article_params)
      render json: @article
      else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:name, :description, :price, :inventory, :user_id, :classification_id)
    end
end