class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @search = Event.articlables.search(params[:search] || {'meta_sort' => 'id.asc'})
    @events = @search.paginate(:page => params[:page]).order('created_at').all || ['event']
  end
end
