class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:index, :new, :create]
  before_action :authenticate_editor!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy, :publish]
  #GET /articles
  def index
    # Obtiene todos los registros
    @articles = Article.paginate(page: params[:page], per_page: 5).publicados.ultimos
  end

  #GET /articles/:id
  def show
    # Va a encontrar un registro por su id
    #@article = Article.find(params[:id])
    @article.update_visits_count
    @comment = Comment.new
  end

  #GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  #POST /articles
  def create
    @article = current_user.articles.new(article_params)
    #Receive all categories
    @article.categories = params[:categories]
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy # Destroy elimina el objeto de la base de datos
    redirect_to articles_path
  end

  #PUT /articles/:id
  def update

    #@article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def publish
    @article.publish!
    redirect_to @article
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :cover, :categories)
  end

end