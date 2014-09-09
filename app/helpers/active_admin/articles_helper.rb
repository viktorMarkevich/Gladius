module ActiveAdmin::ArticlesHelper
  def get_polymorphic_associations
    associations = ActiveRecord::Base.subclasses.select do |model|
      model.reflect_on_all_associations(:has_many).any? do |has_many_association|
        has_many_association.options[:as] == :articlable
      end
    end
  end
end
