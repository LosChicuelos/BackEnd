class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 5)

    render json: @articles
  end

 # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(article_params)  
    
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # PUT /articles/:id
  def update
      @article = article.find(params[:id])
      if @article.update(alliance_params)
        redirect_to @article
      else
      render :edit
    end
  end

  # DELETE /articles/:id
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to article_path
  end

  private
    
  def article_params
      params.require(:article).permit(:name, :description, :price, :inventory, :user_id, :classification_id)
  end
end
