ActiveAdmin.register Article do
  # include Common::Selectors
  permit_params do
    params = [ :to_homepage, :published, :author_id, :school_id, :body, :title, :kind ]
    params
  end

  form do |f|
    f.inputs do
      f.input :school_id, as: :select, collection: School.all.map{ |s| [ s.name, s.id ] }
      f.input :author_id, as: :select, collection: User.all.map{ |u| [ u.full_name, u.id ] }
      f.input :title
      f.input :body
      f.input :kind, :label => "Type article", as: :select, :collection => Article::ARTICLE_TYPES
    end
    f.actions

  end
end
