class ArticlesController < ApplicationController
  #before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.paginatedef(params[:page],params[:page_size])
    render json: @articles
  end
  
  def belongsuser
    @articles = Article.belongsuserid(params[:user_id])
    render json: @articles
  end
  #////////////////////////////////////////////////////////////////////////
  
  def pages
    @number = Article.pages(params[:page_size])
    render json: @number
  end
  
  def filter
    
    #@articles = Article.higher_price_than(params[:max_price]).lower_price_than(params[:min_price]).created_before(params[:start_date]).created_after(params[:ending_date]).in_the_name(params[:name])
    @articles = Article.higher_price_than(params[:max_price]).lower_price_than(params[:min_price]).in_the_name(params[:name]).paginatedef(params[:page],params[:page_size])
    
    render json: @articles
  end

 # GET /articles/:id
  def show
    @article = Article.find(params[:id])
    render json: @article
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
    else
      render :new
    end
  end

  # PUT /articles/:id
  def update
    @article = Article.find(params[:id])
    puts article_params
    if @article.update(article_params)
      render json: @article
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
      params.require(:article).permit(:name, :description, :price, :inventory, :user_id, :classification_id, :picture)
  end

end