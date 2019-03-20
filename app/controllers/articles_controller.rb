class ArticlesController < ApplicationController



  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if    article.user_id == current_user.id
    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)  if current_user.id == article.user_id
    redirect_to root_path
  end


  private
  def article_params
    params.require(:article).permit(:content, :user_id)
  end

end
