class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.paginate(:page => params[:page]).order('id DESC')
  end
end
