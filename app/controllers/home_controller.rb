class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @news = Article.where(published: true, to_homepage: true)
  end

end
