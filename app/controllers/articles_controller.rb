class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.paginate(:page => params[:page]).order('id DESC')
  end

  private

  def user_params
    params.require(:article).permit( :to_homepage, :published, :author_id, :author_type, :school_id, :body, :title, :kind  )
  end
end
