class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.order('id DESC').page(params[:page] || 1).per(5)
    add_breadcrumb 'articles', articles_path
  end

  private

  def user_params
    params.require(:article).permit( :to_homepage, :published, :author_id, :author_type, :school_id, :body, :title, :kind  )
  end
end
