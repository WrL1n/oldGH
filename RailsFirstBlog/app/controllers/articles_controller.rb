class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
    @user = User.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new; end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])

    render_not_found if current_user.id != @article.user_id
  end

  def update
    @article = Article.find(params[:id])

    if current_user.id == @article.user_id

      if @article.update(article_params)
        redirect_to @article
      else
        render action: 'edit'
      end

    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end
