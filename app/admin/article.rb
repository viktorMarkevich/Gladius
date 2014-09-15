ActiveAdmin.register Article do

  before_create do |product|
    product.admin_author = current_admin_user
  end

  permit_params do
    params = [ :to_homepage, :published, :admin_author_id, :author_id, :school_id, :body, :title, :kind ]
    params
  end

  # index do
  #   column :author_id do |article|
  #     AdminUser.find(article.author_id).email
  #   end
  # end

  form do |f|
    f.inputs do
      f.input :school_id, as: :select, collection: School.all.map{ |s| [ s.name, s.id ] }
      # f.input :author_id, as: :select, collection: User.all.map{ |s| [ s.full_name, s.id ] }
      f.input :title
      f.input :body
      f.input :kind, :label => 'Type article', as: :select, :collection => Article::ARTICLE_TYPES
      f.input :published, :label => 'In print ?'
      f.input :to_homepage, :label => 'On home page ?'
    end
    f.actions
  end
end
