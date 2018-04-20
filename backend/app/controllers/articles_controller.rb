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

<<<<<<< HEAD
  # GET /articles/:id
  def show
    @article = article.find(params[:id])
=======
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
>>>>>>> 29ee22455e56b451f562a77a65aee1ec9c0e360c
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

<<<<<<< HEAD
  # PATCH/PUT /articles/:id
=======
  # PUT /articles/:id
>>>>>>> 29ee22455e56b451f562a77a65aee1ec9c0e360c
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
<<<<<<< HEAD
    end
end
=======
  end
end
>>>>>>> 29ee22455e56b451f562a77a65aee1ec9c0e360c
