class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    add_breadcrumb 'index', root_path
    @news = Article.where(published: true, to_homepage: true)
  end

end
