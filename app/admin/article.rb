ActiveAdmin.register Article do
  # include Common::Selectors
  permit_params do
    params = [ :to_homepage, :published, :author_id, :school_id, :body, :title, :articlable_id, :articlable_type ]
    params
  end

  # form do |f|
  #   f.inputs "Details" do
  #     f.input :articlable_type, label: 'Article Type', as: :select, colection: get_polymorphic_associations(Article, :articlable)
  #   end
  #   f.actions
  # end

  # def get_polymorphic_associations(model_object, name)
  #   ActiveRecord::Base.subclasses.select do |model|
  #     model.reflect_on_all_associations(:has_many).any? do |has_many_association|
  #       has_many_association.options[:as] == :articlable
  #     end
  #   end
  # end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
