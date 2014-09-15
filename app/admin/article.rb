ActiveAdmin.register Article do

  filter :title
  filter :body
  filter :published
  filter :to_homepage
  filter :created_at
  filter :kind, as: :select, :collection => Article::ARTICLE_TYPES
  filter :admin_author, collection: AdminUser.all.map{ |a| [a.email, a.id] }, label: 'Author'

  before_create do |product|
    product.admin_author = current_admin_user
  end

  permit_params do
    params = [ :to_homepage, :published, :admin_author_id, :author_id, :school_id, :body, :title, :kind ]
    params
  end

  index do
    selectable_column
    column :id
    column :title
    column :body
    column :published
    column :to_homepage
    column :created_at
    column :updated_at
    column :kind
    column 'Author', :admin_author, :sortable => true
  end


  form do |f|
    f.inputs do
      f.input :school_id, as: :select, collection: School.all.map{ |s| [ s.name, s.id ] }
      f.input :title
      f.input :body
      f.input :kind, :label => 'Type article', as: :select, :collection => Article::ARTICLE_TYPES
      f.input :published, :label => 'In print ?'
      f.input :to_homepage, :label => 'On home page ?'
    end
    f.actions
  end
end
